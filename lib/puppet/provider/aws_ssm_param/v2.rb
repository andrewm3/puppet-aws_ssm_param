Puppet::Type.type(:aws_ssm_param).provide(:v2) do
  confine feature: :aws_sdk

  mk_resource_methods

  def self.region
    Facter.value(:ec2_metadata)['placement']['availability-zone'][0..-2]
  end

  def self.ssm
    Aws::SSM::Client.new(region: region)
  end

  def initialize(resource = nil)
    super(resource)
    @property_flush = {}

    begin
      parameter = self.class.ssm.get_parameter(name: @resource[:name]).parameter

      @property_hash[:ensure] = :present
      @property_hash[:type]   = parameter.type
      @property_hash[:value]  = parameter.value
    rescue Aws::SSM::Errors::ParameterNotFound
      @property_hash[:ensure] = :absent
    end
  end

  def exists?
    @property_hash[:ensure] == :present
  end

  def create
    @property_flush[:ensure] = :present
  end

  def destroy
    self.class.ssm.delete_parameter(name: @resource[:name])
    @property_flush[:ensure] = :absent
  end

  def flush
    if @property_flush[:ensure] == :absent
      self.class.ssm.delete_parameter(name: @resource[:name])
    else
      all_parameters = {
        name:            @resource[:name],
        description:     @resource[:description],
        value:           @resource[:value],
        type:            @resource[:type],
        key_id:          @resource[:key_id],
        overwrite:       @resource[:overwrite],
        allowed_pattern: @resource[:allowed_pattern],
      }

      parameters = all_parameters.reject { |_, v| v.nil? }
      self.class.ssm.put_parameter(parameters)
    end
  end
end

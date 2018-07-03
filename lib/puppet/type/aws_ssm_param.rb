Puppet::Type.newtype(:aws_ssm_param) do
  @doc = 'Manage parameters in the AWS SSM Parameter Store.'

  ensurable

  newparam(:name, namevar: true) do
  end

  newparam(:description) do
  end

  newproperty(:value) do
  end

  newproperty(:type) do
  end

  newparam(:key_id) do
  end

  newparam(:overwrite) do
  end

  newparam(:allowed_pattern) do
  end

  autorequire(:package) do
    'aws-sdk'
  end
end

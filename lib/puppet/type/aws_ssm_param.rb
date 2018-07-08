Puppet::Type.newtype(:aws_ssm_param) do
  @doc = 'Manage parameters in the AWS SSM Parameter Store.'

  ensurable

  newparam(:name, namevar: true) do
    @doc = 'The fully qualified name of the parameter.'
  end

  newparam(:description) do
    @doc = 'An optional description of the parameter.'
  end

  newproperty(:value) do
    @doc = 'The value of the parameter.'
  end

  newproperty(:type) do
    @doc = 'The type of the parameter - either String, StringList or SecureString.'
  end

  newparam(:key_id) do
    @doc = 'The ID of the KMS key used to encrypt the parameter when using the SecureString type.'
  end

  newparam(:overwrite) do
    @doc = 'Whether or not to overwrite the parameter if it exists. Defaults to false.'
  end

  newparam(:allowed_pattern) do
    @doc = 'A regular expression used to validate the parameter value.'
  end

  autorequire(:package) do
    'aws-sdk'
  end
end

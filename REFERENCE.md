# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Resource types**

* [`aws_ssm_param`](#aws_ssm_param): Manage parameters in the AWS SSM Parameter Store.

## Resource types

### aws_ssm_param

Manage parameters in the AWS SSM Parameter Store.

#### Properties

The following properties are available in the `aws_ssm_param` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `value`

The value of the parameter.

##### `type`

The type of the parameter - either String, StringList or SecureString.

#### Parameters

The following parameters are available in the `aws_ssm_param` type.

##### `name`

namevar

The fully qualified name of the parameter.

##### `description`

An optional description of the parameter.

##### `key_id`

The ID of the KMS key used to encrypt the parameter when using the SecureString type.

##### `overwrite`

Whether or not to overwrite the parameter if it exists. Defaults to false.

##### `allowed_pattern`

A regular expression used to validate the parameter value.

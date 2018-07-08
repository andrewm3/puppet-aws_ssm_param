# aws_ssm_param

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with aws_ssm_param](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with aws_ssm_param](#beginning-with-aws_ssm_param)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module provides a resource type to manage parameters in the AWS SSM Parameter Store.

## Setup

### Setup Requirements

The type and provider requires the AWS SDK is installed into the vendored Ruby that comes with Puppet.
This module does not install the package for you - if it is not installed, it can be managed with a `package` resource:

    package { 'aws-sdk':
      ensure   => present,
      provider => puppet_gem,
    }

### Beginning with aws_ssm_param

When creating a parameter, you have to provide name, value and type at a minimum (where name is the fully qualified name). For example:

    aws_ssm_param { '/dev/myserver/myapp/foo':
      type  => 'String',
      value => 'bar',
    }

## Usage

When creating a parameter, you can optionally provide some other attributes, such as `description`, `key_id` and `allowed_pattern` (for more information, see [here](https://docs.aws.amazon.com/cli/latest/reference/ssm/put-parameter.html)).
However, currently these attributes will be enforced only if the value of the parameter changes.

By default, `overwrite` is set to false so if the parameter already exists the value will not be overridden.
To have Puppet enforce this, simply set the `override` attribute to `true`.

## Limitations

This has only been tested on Ubuntu.

## Development

PRs welcome.

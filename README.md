# SixArm.com → Ruby → <br> SecureRandom gem number generator for Ruby 1.8.6, backported from 1.8.7

* Doc: <http://sixarm.com/sixarm_ruby_secure_random/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_secure_random>
* Repo: <http://github.com/sixarm/sixarm_ruby_secure_random>
<!--header-shut-->


## Introduction

This library is an interface for secure random number generator which is
suitable for generating session key in HTTP cookies, etc.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_secure_random

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_secure_random'

### Require

To require the gem in your code:

    require 'sixarm_ruby_secure_random'

<!--install-shut-->


## Details

This gem is a backport of the built-in secure random method from Ruby 1.8.7, and is only intended for use with Ruby 1.8.6 and earlier.

This supports following secure random number generators.

  * openssl
  * /dev/urandom


## Examples

Generate hex:

    SecureRandom.hex(10) => "52750b30ffbc7de3b362"
    SecureRandom.hex(10) => "92b15d6c8dc4beb5f559"
    SecureRandom.hex(11) => "6aca1b5c58e4863e6b81b8"
    SecureRandom.hex(12) => "94b2fff3e7fd9b9c391a2306"
    SecureRandom.hex(13) => "39b290146bea6ce975c37cfc23"

Generate base64:

    SecureRandom.base64(10) => "EcmTPZwWRAozdA=="
    SecureRandom.base64(10) => "9b0nsevdwNuM/w=="
    SecureRandom.base64(10) => "KO1nIU+p9DKxGg=="
    SecureRandom.base64(11) => "l7XEiFja+8EKEtY="
    SecureRandom.base64(12) => "7kJSM/MzBJI+75j8"
    SecureRandom.base64(13) => "vKLJ0tXBHqQOuIcSIg=="

Generate bytes:

    SecureRandom.random_bytes(10) => "\016\t{\370g\310pbr\301"
    SecureRandom.random_bytes(10) => "\323U\030TO\234\357\020\a\337"


## More

For docs go to <http://sixarm.com/sixarm_ruby_secure_random/doc>

Want to help? We're happy to get pull requests.

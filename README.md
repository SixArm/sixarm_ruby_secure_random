# SixArm.com » Ruby » <br> SecureRandom gem number generator for Ruby 1.8.6, backported from 1.8.7

* Doc: <http://sixarm.com/sixarm_ruby_secure_random/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_secure_random>
* Repo: <http://github.com/sixarm/sixarm_ruby_secure_random>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

This library is an interface for secure random number generator which is
suitable for generating session key in HTTP cookies, etc.


## Install quickstart

Install:

    gem install sixarm_ruby_secure_random

Bundler:

    gem "sixarm_ruby_secure_random", "~>1.2.1"

Require:

    require "sixarm_ruby_secure_random"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_secure_random --trust-policy HighSecurity


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


## Changes

* 2012-03-14 1.2.1 Update docs, tests
## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2013 Joel Parker Henderson

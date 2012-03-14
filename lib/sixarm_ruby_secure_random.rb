# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

begin
  require 'openssl'
rescue LoadError
end

module SecureRandom
  # SecureRandom.random_bytes generates a random binary string.
  #
  # The argument n specifies the length of the result string.
  #
  # If n is not specified, 16 is assumed.
  # It may be larger in future.
  #
  # If secure random number generator is not available,
  # NotImplementedError is raised.
  def self.random_bytes(n=nil)
    n ||= 16
    if defined? OpenSSL::Random
      return OpenSSL::Random.random_bytes(n)
    end
    if !defined?(@has_urandom) || @has_urandom
      @has_urandom = false
      flags = File::RDONLY
      flags |= File::NONBLOCK if defined? File::NONBLOCK
      flags |= File::NOCTTY if defined? File::NOCTTY
      flags |= File::NOFOLLOW if defined? File::NOFOLLOW
      begin
        File.open("/dev/urandom", flags) {|f|
          unless f.stat.chardev?
            raise Errno::ENOENT
          end
          @has_urandom = true
          ret = f.readpartial(n)
          if ret.length != n
            raise NotImplementedError, "Unexpected partial read from random device"
          end
          return ret
        }
      rescue Errno::ENOENT
        raise NotImplementedError, "No random device"
      end
    end
    raise NotImplementedError, "No random device"
  end

  # SecureRandom.hex generates a random hex string.
  #
  # The argument n specifies the length of the random length.
  # The length of the result string is twice of n.
  #
  # If n is not specified, 16 is assumed.
  # It may be larger in future.
  #
  # If secure random number generator is not available,
  # NotImplementedError is raised.
  def self.hex(n=nil)
    random_bytes(n).unpack("H*")[0]
  end

  # SecureRandom.base64 generates a random base64 string.
  #
  # The argument n specifies the length of the random length.
  # The length of the result string is about 4/3 of n.
  #
  # If n is not specified, 16 is assumed.
  # It may be larger in future.
  #
  # If secure random number generator is not available,
  # NotImplementedError is raised.
  def self.base64(n=nil)
    [random_bytes(n)].pack("m*").delete("\n")
  end

  # SecureRandom.random_number generates a random number.
  #
  # If an positive integer is given as n,
  # SecureRandom.random_number returns an integer:
  # 0 <= SecureRandom.random_number(n) < n.
  #
  # If 0 is given or an argument is not given,
  # SecureRandom.random_number returns an float:
  # 0.0 <= SecureRandom.random_number() < 1.0.
  def self.random_number(n=0)
    if 0 < n
      hex = n.to_s(16)
      hex = '0' + hex if (hex.length & 1) == 1
      bin = [hex].pack("H*")
      mask = bin[0].ord
      mask |= mask >> 1
      mask |= mask >> 2
      mask |= mask >> 4
      begin
        rnd = SecureRandom.random_bytes(bin.length)
        rnd[0] = (rnd[0].ord & mask).chr
      end until rnd < bin
      rnd.unpack("H*")[0].hex
    else
      # assumption: Float::MANT_DIG <= 64
      i64 = SecureRandom.random_bytes(8).unpack("Q")[0]
      Math.ldexp(i64 >> (64-Float::MANT_DIG), -Float::MANT_DIG)
    end
  end

end

# Added by joelparkerhenderson@gmail.com for backwards compatibility with Ruby 1.8
class Fixnum
 def ord
  return self
 end
end

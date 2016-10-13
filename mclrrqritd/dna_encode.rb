#!/usr/bin/env ruby

module DNA
  module_function
  def encode_string(string)
    Encoder.new(string).encode
  end

  def decode_string(string)
    Decoder.new(string).decode
  end

  Units = [
    "AT",
    "TA",
    "CG",
    "GC"
  ]

  class Encoder
    def initialize(input)
      @input = input
    end

    def encode
      encoding = @input.bytes.map do |byte|
        octal = byte.to_s(4).rjust(4, '0') # ensure 4 unit width
        octal.chars.map do |char|
          Units[char.to_i]
        end
      end
      encoding.flatten.join
    end
  end

  class Decoder
    def initialize(input)
      @input = input
    end

    def decode
      chars = @input.scan(/(..)(..)(..)(..)/).map do |word|
        code = word.map do |unit|
          Units.index(unit).to_s
        end.join
        byte = code.to_i(4)
        byte.chr
      end
      chars.join
    end
  end
end

encoded = DNA.encode_string(File.read(ARGV[0]))
puts encoded
puts DNA.decode_string(encoded)

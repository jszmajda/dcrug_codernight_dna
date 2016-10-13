module DcrugDna
  FORMATTER = "%04d".freeze

  class Encoder
    def initialize(raw_string)
      @raw_string = raw_string
    end

    def encode
      base_four_codes.chars.map { |char| DcrugDna::BASE_PAIRS[char.to_i] }.join
    end

    private

    attr_reader :raw_string

    def base_four_codes
      raw_string.codepoints.map { |codepoint| FORMATTER % codepoint.to_s(4) }.join
    end
  end
end

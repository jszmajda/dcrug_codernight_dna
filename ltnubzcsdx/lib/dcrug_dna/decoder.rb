module DcrugDna
  class Decoder
    def initialize(base_pair_sequence)
      @base_pair_sequence = base_pair_sequence
    end

    def decode
      sequence_as_ordinals.map { |decimal| decimal.chr }.join
    end

    private

    attr_reader :base_pair_sequence

    def base_pairs_as_quaternary
      base_pair_sequence.chars.each_slice(2).map(&:join).map do |pair|
        DcrugDna::BASE_PAIRS.index(pair).to_s
      end
    end

    def sequence_as_ordinals
      base_pairs_as_quaternary.each_slice(4).map(&:join).map do |base_four|
        base_four.to_i(4).to_i
      end
    end
  end
end

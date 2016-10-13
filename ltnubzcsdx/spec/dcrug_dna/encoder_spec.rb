require "spec_helper"

describe DcrugDna::Encoder do
  describe "#encode" do
    it "encodes the string as a sequence of DNA base pairs" do
      input_string = "The"

      result = DcrugDna::Encoder.new(input_string).encode

      expect(result).to eq("CGCGCGATCGGCGCATCGGCCGCG")
    end
  end
end

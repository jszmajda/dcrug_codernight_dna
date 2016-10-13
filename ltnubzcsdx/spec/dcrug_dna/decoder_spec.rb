require "spec_helper"

describe DcrugDna::Decoder do
  describe "#decode" do
    it "decodes the string of DNA base pairs and returns the original string" do
      input_string = "CGCGCGATCGGCGCATCGGCCGCG"

      result = DcrugDna::Decoder.new(input_string).decode

      expect(result).to eq("The")
    end
  end
end

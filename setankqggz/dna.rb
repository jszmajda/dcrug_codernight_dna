class DNA
	def initialize
		@key = {
			"1"=>"ATAT",
			"2"=>"ATTA", 
			"3"=>"ATGC", 
			"4"=>"ATCG",
			"5"=>"TAAT",
			"6"=>"TATA", 
			"7"=>"TAGC", 
			"8"=>"TACG", 
			"9"=>"GCTA", 
			"0"=>"GCAT"
		}

	end
	def encode string
		encoded_str = ""
		string.each_byte do |s|
			s = (s-32).to_s
			s = "0" + s if  s.to_i < 9
			s.each_char do |c|
				encoded_str += @key[c]
			end
		end
		encoded_str
	end
	def decode string
		decoded_str = ""
		i = 0
		while i < string.length
			num = @key.key(@encoded_str[i...i+4]) + @key.key(string[i+4...i+8])
			decoded_str += (num.to_i + 32).chr
			i += 8
		end
		decoded_str 
	end
end
DNAencoder = DNA.new
puts DNAencoder.encode("hi")

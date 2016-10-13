# As "z".ord is 122 and we only have 4 pair units available (AT-TA-CG-GC)
# ...we'll need 4^x > 122, or x = 4
# ...that's the reason we convert every char to the base 4

##########
# Encoding
##########

string = File.open('input.txt').first.chomp

encoding = ""
string.each_char do |char|
  # convert to a number on base 4
  base_four_number = char.ord.to_s(4)

  # if less than 4 digits, fill with zeroes
  (4 - base_four_number.length).times do
    encoding += "0"
  end
  encoding += base_four_number
end

# now replace each digit with DNA pair units
encoded_dna = encoding.gsub('0','AT').gsub('1','TA').gsub('2','CG').gsub('3','GC')
p "From: " + string
p "To: " + encoded_dna


##########
# Decoding
##########

decoding = ""
encoded_dna.each_char.with_index do |char, index|
  if index % 2 == 0
    decoding += "0" if encoded_dna[index,2] == "AT"
    decoding += "1" if encoded_dna[index,2] == "TA"
    decoding += "2" if encoded_dna[index,2] == "CG"
    decoding += "3" if encoded_dna[index,2] == "GC"
  end
end

decoded_dna = ""
decoding.each_char.with_index do |char, index|
  if index % 4 == 0
    decoded_dna += decoding[index,4].to_i(4).chr
  end
end

p "============================"
p "And back to its decoded version:"
p decoded_dna

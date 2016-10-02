chrs = ('a'..'z').to_a
puts 10.times.map{ chrs[rand(chrs.length)] }.join

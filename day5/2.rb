f = File.read("input").split("\n")

c = 0
f.each do |row|
  next unless row =~ /([[:alpha:]]{2}).*\1/
  next unless row =~ /([[:alpha:]])[[:alpha:]]\1/

  c += 1
end

puts c

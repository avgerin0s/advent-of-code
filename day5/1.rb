f = File.read("input").split("\n")

c = 0
f.each do |row|
  next unless row =~ /[aeiou].*[aeiou].*[aeiou]/
  next unless row != row.squeeze
  next if row =~/(ab|cd|pq|xy)/

  c += 1
end

puts c

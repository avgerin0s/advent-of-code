f = File.read("input").split("\n")

raw = f.map(&:size).reduce(:+)
encoded = f.map { |s| s.inspect }.flatten.map(&:size).reduce(:+)

puts encoded - raw

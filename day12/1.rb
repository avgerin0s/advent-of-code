f = File.read("input")

puts f.scan(/-?\d+/).map(&:to_i).reduce(:+)

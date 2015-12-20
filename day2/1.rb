input = File.read("input").split("\n")

total = 0

input.each do |box|
  dimensions = box.split("x").map(&:to_i)
  dimensions << dimensions.first

  calculations = dimensions.each_cons(2).map { |arr| arr.first * arr.last }

  total += calculations.min + calculations.map { |s| s*2 }.reduce(:+)
end

puts total

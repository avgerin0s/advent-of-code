input = File.read("input").split("\n")

total = 0

input.each do |box|
  l,w,h = dimensions = box.split("x").map(&:to_i)
  dimensions << dimensions.first

  vol = l*w*h
  bow = dimensions.each_cons(2).map { |arr| 2 * (arr.first + arr.last) }.min

  total += vol + bow
end

puts total

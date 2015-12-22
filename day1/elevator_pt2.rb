f = File.read("input")

floor = 0
res = f.split("").index do |instruction|
  floor += (instruction == "(") ? 1 : -1
  floor == -1
end + 1

puts res

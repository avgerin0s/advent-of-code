f = File.read("input").split("\n")

res = 0
f.each do |d|
  res += (d.size - eval(d).size)
end

puts res

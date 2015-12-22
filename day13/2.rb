f = File.read("input")

names = `cat input | awk '{ print $1 }'`.split("\n").uniq
names << "Me"
h = Hash.new { |hash, key| hash[key] = 0 }

f.split("\n").each do |line|
  name1, _, sign, val, _, _, _, _, _, _, name2 = line.split(" ")
  sign = sign == "gain" ? "+" : "-"
  name2.gsub!(".", "")
  h[[name1, name2]] = "#{sign}#{val}".to_i
end

puts h

b = names.permutation(names.size).map { |p| p.unshift(p.last) }.map do |permutation|
  permutation.each_cons(2).map do |pair|
    h[pair] + h[pair.reverse]
  end.reduce(:+)
end.max

puts b

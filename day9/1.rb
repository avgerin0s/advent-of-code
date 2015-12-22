require "set"
f = File.read("input").split("\n")

hash = {}
places = Set.new

f.each do |d|
  from, _, to, _, distance = d.split(" ")
  places.add(from)
  places.add(to)
  key = [from, to].sort
  hash[key] = distance.to_i
end

min = nil
winner = nil
places.to_a.permutation.each do |seq|
  distance = seq.each_cons(2).map { |s| hash[s.sort] }.reduce(:+)

  if min.nil?
    min = distance
    winner = seq
    next
  end

  if min > distance
    min = distance
    winner = seq
  end
end

puts winner.join(" -> ") + " = #{min}"

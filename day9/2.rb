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

max = nil
winner = nil
places.to_a.permutation.each do |seq|
  distance = seq.each_cons(2).map { |s| hash[s.sort] }.reduce(:+)

  if max.nil?
    max = distance
    winner = seq
    next
  end

  if max < distance
    max = distance
    winner = seq
  end
end

puts winner.join(" -> ") + " = #{max}"

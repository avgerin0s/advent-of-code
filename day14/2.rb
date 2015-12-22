f = File.read("input").split "\n"

hash = {}
points = Hash.new { |h, k| h[k] = 0 }
time = 2503

f.each do |line|
  raindeer, speed, fly_duration, rest_duration =
    line.scan(/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\w+) /).flatten

  hash[raindeer] = {
    speed: speed.to_i,
    fly_duration: fly_duration.to_i,
    rest_duration: rest_duration.to_i,
    fly_time_elapsed: 0,
    rest_time_elapsed: 0,
    distance: 0
  }

end

(1..time).each do |n|
  hash.each do |r, h|
   if (hash[r][:fly_time_elapsed] < hash[r][:fly_duration]) && (hash[r][:rest_time_elapsed].zero? || hash[r][:rest_time_elapsed] == hash[r][:rest_duration])
     hash[r][:rest_time_elapsed] = 0
     hash[r][:distance] += hash[r][:speed]
     hash[r][:fly_time_elapsed] += 1
   elsif (hash[r][:fly_time_elapsed] == hash[r][:fly_duration]) || hash[r][:rest_time_elapsed] > 0
     hash[r][:fly_time_elapsed] = 0
     hash[r][:rest_time_elapsed] += 1
   end
  end

  max = hash.values.map { |s| s[:distance] }.max
  hash.select { |_, v| v[:distance] == max }.each { |k, _| points[k] += 1 }
end

puts points

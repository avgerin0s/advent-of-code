f = File.read("input").split "\n"

hash = {}
time = 2503

f.each do |line|
  raindeer, speed, fly_duration, rest_duration =
    line.scan(/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\w+) /).flatten

  hash[raindeer] = { 
    speed: speed.to_i,
    fly_duration: fly_duration.to_i,
    rest_duration: rest_duration.to_i
  }
end

max = hash.map do |r, h|
  distance_per_turn = h[:speed] * h[:fly_duration]
  time_frame_used = h[:fly_duration] + h[:rest_duration]

  distance = (time / time_frame_used) * distance_per_turn
  mod = (time % time_frame_used)

  if mod > h[:fly_duration]
    mod = h[:fly_duration]
  end
  distance += mod * h[:speed]

  distance
end.max

puts max

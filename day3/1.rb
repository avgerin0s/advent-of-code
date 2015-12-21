x, y = 0, 0

visited = [[x,y]]

f = File.read("input").split("")

f.each do |instruction|
  case instruction
  when '>'
    x += 1
  when '<'
    x -= 1
  when '^'
    y += 1
  when 'v'
    y -= 1
  end

  visited << [x,y]
end

puts visited.uniq.count

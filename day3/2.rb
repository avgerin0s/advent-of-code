x, y = 0, 0
rx, ry = 0, 0

visited = [[x,y]]

f = File.read("input").split("")

santa = true

f.each do |instruction|
  case instruction
  when '>'
    santa ? x += 1 : rx += 1
  when '<'
    santa ? x -= 1 : rx -= 1
  when '^'
    santa ? y += 1 : ry += 1
  when 'v'
    santa ? y -= 1 : ry -= 1
  end

  visited << if santa
               [x,y]
            else
              [rx, ry]
            end

  santa = !santa
end

puts visited.uniq.count

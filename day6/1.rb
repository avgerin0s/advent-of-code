f = File.read("input").split("\n")


m = Array.new(1000) { Array.new(1000) { 0 } }

f.each do |instruction|
  op = nil

  if instruction =~ /\Aturn on/
    op = 1
  elsif instruction =~ /\Aturn off/
    op = 0
  else
    op = -1
  end

  instruction.gsub!(/[[:alpha:]]+/, "")
  sx, sy, tx, ty = instruction.split(" ").map { |s| s.split(",") }.flatten!.map(&:to_i)

  sx.upto(tx) do |i|
    sy.upto(ty) do |j|
      m[i][j] = op >= 0 ? op : 1 - m[i][j]
    end
  end
end


puts m.flatten!.select { |n| n == 1 }.count

f = File.read("input").split("\n")


m = Array.new(1000) { Array.new(1000) { 0 } }

f.each do |instruction|
  op = nil

  if instruction =~ /\Aturn on/
    op = 1
  elsif instruction =~ /\Aturn off/
    op = -1
  else
    op = 2
  end

  instruction.gsub!(/[[:alpha:]]+/, "")
  sx, sy, tx, ty = instruction.split(" ").map { |s| s.split(",") }.flatten!.map(&:to_i)

  sx.upto(tx) do |i|
    sy.upto(ty) do |j|
      m[i][j] += op
      m[i][j] = 0 if m[i][j] < 0
    end
  end
end


puts m.flatten!.reduce(:+)

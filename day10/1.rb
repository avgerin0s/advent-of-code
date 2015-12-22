input = "3113322113"

40.times do |_|
  temp = ""
  input.scan(/((\d)\2*)/).each do |match, digit|
    temp << "#{match.length}#{digit}"
  end

  input = temp
end

puts input.length

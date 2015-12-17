instructions = File.read("input")

ups = instructions.count("(")
downs = instructions.count(")")

puts "Total: #{ups - downs}"

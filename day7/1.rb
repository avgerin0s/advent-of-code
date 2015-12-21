f = File.read("input")

ops = {
  "AND" => '&',
  "OR" => "|",
  "RSHIFT" => ">>",
  "LSHIFT" => "<<",
  "NOT" => "~",
}

instructions =
  f.gsub(/#{ops.keys.join("|")}/, ops).
  gsub(/(.+?) -> ([[:alnum:]]+)/) { "%2s = #$1" % $2 }.upcase.
  split("\n").sort.rotate

puts instructions
puts eval instructions.join(";")

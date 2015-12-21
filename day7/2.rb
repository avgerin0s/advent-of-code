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

instructions.map { |s| s.split(" ") }.flatten.select { |s| s. =~ /[[:alpha:]]+/ }.each { |s| eval "s = 0" }
B = 46065

puts eval instructions.reject { |s| s =~ /^ B = \d+/ }.join(";")


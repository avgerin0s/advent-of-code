require "json"

data = JSON.parse(File.read("input"))

def sum(data)
  if data.is_a?(Array)
    data.map { |d| sum(d) }.reduce(:+)
  elsif data.is_a?(Hash)
    return 0 if data.keys.include?("red") || data.values.include?("red")
    data.map { |d| sum(d) }.reduce(:+)
  elsif data.is_a?(Numeric)
    data
  else
    0
  end
end

puts sum(data)

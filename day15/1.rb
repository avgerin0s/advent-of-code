hash = {}

# Populate
File.read("input").split("\n").each do |line|
  ingredient, capacity, durability, flavor, texture, _ = line.scan(/^(\w+): capacity (-?\d+), durability (-?\w+), flavor (-?\w+), texture (-?\w+), calories (-?\w+)/).flatten

  hash[ingredient] = {
    capacity: capacity.to_i,
    durability: durability.to_i,
    flavor: flavor.to_i,
    texture: texture.to_i
  }
end

puts hash

max = 0

(0..100).each do |i|
  (0..100 - i).each do |j|
    (0..100 - i - j).each do |k|
      l = 100 - i - j - k

      prod = 1
      features = [:capacity, :durability, :flavor, :texture]

      features.each do |feat|
        each_ing = hash.values.compact.map { |s| s[feat] }
        p = each_ing[0] * i + each_ing[1] * j + each_ing[2] * k + each_ing[3] * l
        next if p <= 0
        prod *= p
      end

      if prod > max
        max = prod
      end
    end
  end
end

puts max

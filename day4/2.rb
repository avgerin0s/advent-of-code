require "digest/md5"

input = "iwrupvqb"

c = 1
flag = false

while !flag do
  flag = Digest::MD5.hexdigest(input + c.to_s) =~ /^0{6}/

  c += 1
end

puts c - 1

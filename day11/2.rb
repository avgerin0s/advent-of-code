pwd = "cqjxjnds"

$iol = /i|o|l/
$twocons = /(.)\1/

def seq?(pwd)
  triplets = pwd.each_byte.each_cons(3)
  triplets.each do |a, b, c|
    if b - a == 1 && c - b == 1
      return true
    end
  end

  false
end

def valid?(pwd)
  !(pwd =~ $iol) && seq?(pwd) && (pwd.scan($twocons).size > 1)
end

pwd.succ! until valid?(pwd)

pwd.succ!
pwd.succ! until valid?(pwd)

puts pwd

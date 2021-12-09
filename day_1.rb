require 'enumerator'
count = 0
day_1_input = File.readlines("day_1_input.txt")
day_1_input.each_cons(2) do |first, second|
  if first.to_i < second.to_i
    count += 1
  end
end
puts count
count = 0

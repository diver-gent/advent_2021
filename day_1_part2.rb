require 'enumerator'
count = 0
triplets = []
day_2_input = File.readlines("day_1_input.txt")
day_2_input.each_cons(3) do |i, j, k|
  sum = i.to_i + j.to_i + k.to_i
  triplets.push(sum)
end
triplets.each_cons(2) do |first, second|
  if first.to_i < second.to_i
    count += 1
  end
end
puts count

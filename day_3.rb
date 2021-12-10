day_3_input = File.readlines("day_3_input.txt")
gamma = "0b" 
epsilon = "0b"
val = day_3_input[0].length() - 1
for i in 0..val do
  foo = day_3_input.map {|row| row[i]}
  bar = foo.max_by { |j| foo.count(j)}
  gamma << bar
end
for i in 0..val do
  foo = day_3_input.map {|row| row[i]}
  bar = foo.min_by { |j| foo.count(j)}
  epsilon << bar
end
puts Integer(gamma)
puts Integer(epsilon)
puts Integer(gamma) * Integer(epsilon)


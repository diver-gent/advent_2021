day_3_o = File.readlines("day_3_input.txt")
day_3_co2 = File.readlines("day_3_input.txt")
len = day_3_o[0].length() - 1
for i in 0..len do
  foo = day_3_o.map {|row| row[i]}
  bar = foo.max_by {|j| foo.count(j)}
  check = foo.min_by {|j| foo.count(j)}
  if bar == check
    bar = "1"
  end
  day_3_o = day_3_o.delete_if {|x| x[i] != bar}
  if day_3_o.length() == 1
    break
  end
end
for i in 0..len do
  foo = day_3_co2.map {|row| row[i]}
  bar = foo.min_by { |j| foo.count(j)}
  check = foo.max_by {|j| foo.count(j)}
  if bar == check
    bar = "0"
  end
  day_3_co2 = day_3_co2.delete_if {|x| x[i] != bar}
  if day_3_co2.length() == 1
    break
  end
end
puts day_3_o
puts day_3_co2
puts day_3_o[0].to_i(2) * day_3_co2[0].to_i(2)


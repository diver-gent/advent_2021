require 'enumerator'
horiz = 0
depth = 0
depth2 = 0
aim = 0
day_2_input = File.readlines("day_2_input.txt")
day_2_input.each do |i|
  command, value = i.split(/ /)
  x = value.to_i
  case command
  when "forward"
    horiz += x
    depth2 += aim * x
  when "down"
    depth += x
    aim += x
  when "up"
    depth -= x
    aim -= x
  end
end
puts horiz * depth2

def get_input(file)
  _x1 = []
  _y1 = []
  _x2 = []
  _y2 = []
  File.foreach("day_5_input.txt").each_with_index do |row, i|
    p1, p2 = row.split('->')
    x1, y1 = p1.split(',')
    x2, y2 = p2.split(',')
    _x1[i] = x1.to_i
    _y1[i] = y1.to_i
    _x2[i] = x2.to_i
    _y2[i] = y2.to_i
  end
  return _x1, _y1, _x2, _y2
end

points = []
points = get_input("day_5_input.txt")
x_max = [points[0].max(), points[2].max()].max()
y_max = [points[1].max(), points[3].max()].max()
grid = Array.new(x_max+1) {Array.new(y_max+1,0)}
points[0].length.times do |i|
  if (points[0][i] != points[2][i]) && (points[1][i] != points[3][i])
    next
  end
  # puts "#{points[0][i]} #{points[2][i]} #{points[1][i]} #{points[3][i]}"
  # get min and max values for x1 x2 y1 y2
  xmin = [points[0][i], points[2][i]].min() 
  xmax = [points[0][i], points[2][i]].max()
  ymin = [points[1][i], points[3][i]].min() 
  ymax = [points[1][i], points[3][i]].max()
  for x in xmin..xmax
    for y in ymin..ymax
      grid[x][y] += 1
    end
  end
end
sum = 0
grid.each do |r|
  r.each do |e|
    if e > 1
      sum += 1
    end
  end
end
puts sum

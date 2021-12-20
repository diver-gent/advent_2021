def board_wins?(b)
  b.each do |row| 
    if not row.any?
      return true
    end
  end
  b.transpose.each do |col|
    if not col.any?
      return true
    end
  end
  return false
end

draws = [90,4,2,96,46,1,62,97,3,52,7,35,50,28,31,37,74,26,59,53,82,47,83,80,19,40,68,95,34,55,54,73,12,78,30,63,57,93,72,77,56,91,23,67,64,79,85,84,76,10,58,0,29,13,94,20,32,25,11,38,89,21,98,92,42,27,14,99,24,75,86,51,22,48,9,33,49,18,70,8,87,61,39,16,66,71,5,69,15,43,88,45,6,81,60,36,44,17,41,65]
boards = []
count = 0
File.foreach("day_4_input.txt").each_slice(6) do |raw_board|
  board = []
  raw_board.pop()
  raw_board.each do |row|
    board << row.split
  end
  boards[count] = board
  count += 1
end

sum = 0
results = Marshal.load(Marshal.dump(boards))
                  
draws.each do |draw|
  boards.each_with_index do |board, xi|
    board.each_with_index do |row, bi|
      row.each_with_index do |val, ri|
        if val.to_i == draw.to_i
          results[xi][bi][ri] = nil
        end
      end
    end
    if board_wins?(results[xi])
      puts boards[xi].join(" ")
      puts results[xi].join(" ")
      puts draw
      winner = results[xi].flatten.compact
      winner.each do | val |
        sum += val.to_i
      end
      puts sum * draw
      exit
    end
  end
end

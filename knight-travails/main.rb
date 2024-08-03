POSSIBLE_MOVES = [
  [-2, -1],
  [-2, 1],
  [-1, -2],
  [-1, 2],
  [1, -2],
  [1, 2],
  [2, -1],
  [2, 1]
].freeze

def knight_moves(start, destination)
  que = [[start, [start]]]

  until que.empty?
    pos, path = que.shift
    return path if pos == destination

    x, y = pos
    POSSIBLE_MOVES.each do |dx, dy|
      next_pos = [x + dx, y + dy]
      que << [next_pos, path + [next_pos]] if valid_pos?(next_pos)
    end
  end
end

def valid_pos?(pos)
  x, y = pos
  x <= 7 and x >= 0 and y <= 7 and y >= 0
end

p knight_moves([0, 0], [7, 7])

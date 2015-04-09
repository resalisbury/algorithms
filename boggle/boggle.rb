# Boggle - if a word can be found in an nxn grid, return true
board = [['p','p','p','p'],
        ['g','h','a','f'],
        ['g','g','t','a'],
        ['g','g','s','a']]

def word_search(board, word)
  length = board.length
  length.times do |row|
    length.times do |column|
      return true if found?(board, word, row, column)
    end
  end
  return false
end

def found?(board, word, row, column)
  return false if word[0] != board[row][column]
  return true if word.length == 0
  board[row][column] = nil # mark as visited
  neighbors = get_neighbors(board.length, row, column)
  neighbors.each do |neighbor|
    row, column = neighbor[0], neighbor[1]
    return true && found?(board, word[1..-1], row, column) if word[1] == board[row][column]
  end
  return false
end

def get_neighbors(board_length, row, column)
  neighbors = []
  neighbors << [row - 1, column - 1]  if row - 1 >= 0  &&  column - 1 >= 0
  neighbors << [row - 1, column]      if row - 1 >= 0
  neighbors << [row - 1, column + 1]  if row - 1 >= 0  &&  column + 1 < board_length
  neighbors << [row, column - 1]      if column - 1 >= 0
  neighbors << [row, column + 1]      if column + 1 < board_length
  neighbors << [row + 1, column - 1]  if row + 1 < board_length && column - 1 >= 0
  neighbors << [row + 1, column]      if row + 1 < board_length
  neighbors << [row + 1, column + 1]  if row + 1 < board_length && column + 1 < board_length
  neighbors
end

puts word_search(board, 'pppp')
puts word_search(board, 'ggggg')
puts word_search(board, 'hatas')

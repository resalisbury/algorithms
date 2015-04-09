# Boggle - if a word can be found in an nxn grid, return true
board = [['g','h','c','f'],
        ['g','h','a','f'],
        ['g','h','t','f'],
        ['g','h','c','s']]



def word_search(board, word)
  length = board.length
  length.times do |row|
    length.times do |column|
     puts word[0] == board[row][column]
      return true if word[0] == board[row][column] && found?(board, word[1..-1], row, column)
    end
  end
  puts "final false"
  return false
end


# return true or false
def found?(board, word, row, column)
  if word.length == 0
    return true
  end

  neighbors = get_neighbors(board.length, row, column)
  puts "neighbors: #{neighbors}"

  neighbors.each do |neighbor|
    row, column = neighbor[0], neighbor[1]
    if word[0] == board[row][column]
      puts "letter: #{word[0]}, neighbor: #{board[row][column]}"
      return true && found?(board, word[1..-1], row, column)
    end
  end
  puts "flase w/in found?"
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

# p get_neighbors(4, 0, 0)

puts word_search(board, 'cats')

# Depth First Search Implementation
# Depth First Search Implementation
class Sudoku

  attr_reader :board, :position
  def initialize(board_string)
    @original_board = board_string.split('').map { |e| e.to_i }
    @solved_board = @original_board.clone
    @position = 8
    @stack = [0]
    solve
  end

  def solve
    while @stack.length != 0
      @position = @stack.pop
      if @original_board[@position] != 0
        @stack.push(@position + 1)
      else
        @solved_board[@position] += 1
        until is_valid? || @solved_board[@position] > 9
          @solved_board[@position] += 1
        end
        if @solved_board[@position] <= 9
          @stack << @position << (@position + 1)
        else
          puts "reseting current position to 0"
          @solved_board[@position] = 0
        end
        sleep(0.02)
        reset_screen!
        to_s
        break if @position + 1 >= 81
      end
    end
    sleep(2)
    p "You Win!!!"
  end
  def is_valid?
    row_valid? && column_valid? && box_valid?
  end

  def row_valid?
    uniq?(current_row)
  end

  def column_valid?
    uniq?(current_column)
  end

  def box_valid?
    uniq?(current_box)
  end

  def uniq?(array)
    array.delete(0)
    array == array.uniq
  end

  def current_row
    @solved_board.slice(row_number * 9, 9)
  end

  def current_column
    column = []
    9.times do |i|
      column << @solved_board[i*9 + column_number]
    end
    column
  end

  def column_number
    @position % 9
  end

  def row_number
    @position/9
  end

  def current_box
    position = box_start
    box = []
    3.times do |i|
      box.concat(@solved_board.slice(position + (i*9), 3))
    end
    box
  end

  def box_start
    column_number / 3 * 3 + row_number / 3 * 3 * 9
  end

  def to_s
    9.times do |i|
      p @solved_board.slice(i*9, 9)
    end
    p "Position: #{@position}"
    p "Stack: #{@stack}"
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def reset_screen!
    clear_screen!
    move_to_home!
  end
end

# Sudoku.new('1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--')
# Sudoku.new('----------2-65-------18--4--9----6-4-3---57-------------------73------9----------')
Sudoku.new('-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--')

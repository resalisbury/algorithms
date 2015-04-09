class DrawCircle
  attr_reader :canvas
  def initialize(radius)
    @canvas = blank_canvas("  ")
    @visited = blank_canvas(false)
    @radius = radius
  end

  def blank_canvas(val)
    Array.new(50).map { |e| e = Array.new(50) {"  "} }
  end

  def draw(row = 49, col = 49)
    return  if @visited[row][col] == true
    puts row, col
  end

  def display
    @canvas.each do |row|
      p row.join("")
    end
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

c = DrawCircle.new(10)
c.display
puts c.canvas.length
c.draw
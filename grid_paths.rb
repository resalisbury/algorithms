# Calculated the number of unique paths in an X by Y grid from the top left position (1,1) to the bottom right position (X,Y), where you can only move in the positive x or positive y direction.

def getNumOfDistPaths(x,y)
  if (x < 1 || y < 1)
    return 0;
  end
  if (x ==1 || y ==1)
    return 1;
  end
  return getNumOfDistPaths(x-1,y) + getNumOfDistPaths(x, y-1);
end

puts "Grid    Paths"
puts "1x1:    #{getNumOfDistPaths(1,1)}"
puts "10x1:   #{getNumOfDistPaths(10,1)}"
puts "1x10:   #{getNumOfDistPaths(1,10)}"
puts "3x3:    #{getNumOfDistPaths(3,3)}"
puts "4x4:    #{getNumOfDistPaths(4,4)}"
puts "7x5:    #{getNumOfDistPaths(7,5)}"
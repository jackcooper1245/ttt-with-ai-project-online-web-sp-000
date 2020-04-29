require 'pry'
module Players

class Computer < Player

def move(board)
  if !board.full?
 "1" unless "1" == "X" || "1" == "O"
 "2" unless "2" == "X" || "2" == "O"
 "3" unless "3" == "X" || "3" == "O"
 "4" unless "4" == "X" || "4" == "O"
 "5" unless "5" == "X" || "5" == "O"
 "6" unless "6" == "X" || "6" == "O"
 "7" unless "7" == "X" || "7" == "O"
 "8" unless "8" == "X" || "8" == "O"
 "9" unless "9" == "X" || "9" == "O"
 end
end

end

end

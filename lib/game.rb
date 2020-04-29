class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def initialize(player_1 = Players::Human.new(token = 'X'), player_2 = Players::Human.new(token = "O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2

end

def self.start
  puts "Welcome to Tic Tac Toe!"
  puts "If you would like to play against AI type '1 player game'"
  puts "If you would like to play against a friend type '2 player game'"
  puts "If you would like to see the AI play itself type '0 player game'"
  input = gets.strip
  case input
  when '1 player game'
    Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
  when '2 player game'
    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
  when '0 player game'
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
  end
end

def current_player
  board.turn_count % 2 == 0 ? @player_1 : @player_2
end

def won?
 WIN_COMBINATIONS.find do |win_combination|
   board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
   board.cells[win_combination[1]] == board.cells[win_combination[2]] &&
   board.cells[win_combination[0]] != " "
end
end

def draw?
   !won? && board.full?
end

def over?
 won? || draw?
end

def winner
  board.cells[won?[0]] if won?
end

def turn
  input = current_player.move(board).to_i
    if board.valid_move?(input.to_s)
      board.update(input, current_player)
    else !board.valid_move?(input.to_s)
      turn
    end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
end
end


end

require_relative "player_class.rb"
require_relative "game_functions.rb"

player1_symbol = nil
player2_symbol = nil
$game_ongoing = true

until player1_symbol == "X" or player1_symbol == "O" do
  puts "Enter player 1 preference- X or O"
  player1_symbol = gets.chomp.upcase
end

player2_symbol = player1_symbol == "X" ? "O" : "X"

# initialize the players
player1 = Player.new(player1_symbol)
player2 = Player.new(player2_symbol)

Player.print_board

# the game starts!
0.upto(8) do
  get_user_input(player1)
  break if $game_ongoing == false
  get_user_input(player2)
end

puts "Game over"

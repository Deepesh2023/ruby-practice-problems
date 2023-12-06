class Player
  attr_reader :player_symbol
  attr_accessor :win_count

  @@game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize(player_symbol)
    @player_symbol = player_symbol
    self.win_count = 0
  end

  def to_s
    @player_symbol
  end

  def is_position_valid?(position)
    # checking board for valid positions
    return false unless @@game_board[position - 1] == position
  end

  def mark_position(position)
    @@game_board[position - 1] = self
    Player.print_board
  end

  def self.get_board
    @@game_board
  end

  def self.print_board()
    for i in 0..8
      print "#{@@game_board[i]} "  
      print "\n" if (i + 1) % 3 == 0
    end
  end
end
def get_user_input(player)
-# checking valid input
  position = 42
  while position < 1 or position > 9 or player.is_position_valid?(position) == false 
    puts "Enter position for #{player}"
    position = gets.chomp.to_i
  end
  player.mark_position(position)
  who_is_winner?(player)
end


def who_is_winner?(player)
  # check horizontal
  for i in 0..6
    unless i % 3 == 0 
      player.win_count = 0
      next
    end
    if Player.get_board[i] == player
      player.win_count = 0
      check_straight(player, i, 1)
    end
  end

  return if $game_ongoing == false

  # check vertical
  for i in 0..2
    next unless Player.get_board[i] == player
    player.win_count = 0
    check_straight(player, i, 3)
  end

  return if $game_ongoing == false

  # check diagonally 
  if Player.get_board[0] == player
    player.win_count = 0
    check_diagonally(player, 0, 4)
    return if $game_ongoing == false
  end

  if Player.get_board[2] == player
    player.win_count = 0
    check_diagonally(player, 2, 2)
    return if $game_ongoing == false
  end
end

def check_straight(player, i, step_to_be_taken)
  if player.win_count == 2
    $game_ongoing = false
    player.win_count = 0
    puts "#{player} won!"
    return
  end 
  return unless Player.get_board[i + step_to_be_taken] == player

  player.win_count += 1
  check_straight(player, i + step_to_be_taken, step_to_be_taken)
end

def check_diagonally (player, start, step_to_be_taken)
  if player.win_count == 2
    $game_ongoing = false
    player.win_count = 0
    puts "#{player} won!"
    return
  end 
  return unless Player.get_board[start + step_to_be_taken] == player

  player.win_count += 1
  check_diagonally(player, start + step_to_be_taken, step_to_be_taken)
end

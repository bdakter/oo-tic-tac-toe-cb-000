class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom
    [0, 3, 6],  # left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],   # Right column
    [0, 4, 8],  #backslash
    [2, 4, 6]   #forward_slash
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
      counter = 0
      @board.each do |box|
        if ["X", "O"].include?box.strip
          counter +=1
        end
      end
      counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |combo|
          win_index_1 = combo[0]
          win_index_2 = combo[1]
          win_index_3 = combo[2]

        if
          (@board[win_index_1] == "X"  && @board[win_index_2] == "X"  && @board[win_index_3] == "X") ||
          (@board[win_index_1] == "O"  && @board[win_index_2] == "O"  && @board[win_index_3] == "O")

          return combo
        end
      end
  end

  def full?
    !@board.detect{|i| i == " "}
  end

  def draw?
    if
      full? && !won?
      true
    elsif
      full? && won?
      false
    else
      !won?
      false
    end
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if over?
      winning_combo = won?

    end
  end



end

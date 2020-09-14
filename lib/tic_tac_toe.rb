class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
end

    WIN_COMBINATIONS = 
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]

  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  def input_to_index(input)
    input.to_i - 1 
  end
  def move(index, token)
    @board[index] = token 
    @board
  end
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      false
    end
  end
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end
  def turn_count
    counter = 0 
    @board.each do |index|
      if index == "X" || index == "O"
        counter += 1 
      end
    end
    counter
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
    WIN_COMBINATIONS.each do |combo|
      position1 = @board[combo[0]]
      position2 = @board[combo[1]]
      position3 = @board[combo[2]]
      if position1 == "X" && position2 == "X" && position3 == "X" || position1 == "O" && position2 == "O" && position3 == "O"
        return combo
      end
    end
    return false
  end
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  def draw?
    if !won? && full?
      true
    else
      false
    end
  end
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
end
  def winner 
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return "X"
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return "O"
      else
        return nil
      end
    end
  end
  
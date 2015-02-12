def initialize_board(b)
  b = {}
  (1..9).each {|position| b[position] = " "}
  b
end

def draw_board(b)
  puts "________________________"
  puts "|#{b[1]}____|#{b[2]}____|#{b[3]}____|"
  puts "|#{b[4]}____|#{b[5]}____|#{b[6]}____|"
  puts "|#{b[7]}____|#{b[8]}____|#{b[9]}____|"
end

def empty_positions(b)
  b.select {|k, v| v == " "}.keys
end

def player_picks_square(b)
  puts "Pick a square (1-9):"
 # puts "_________"
 # puts "|__1__|__2__|__3__|"
  #puts "|__4__|__5__|__6__|"
 # puts "|__7__|__8__|__9__|"
  position = gets.chomp.to_i
  b[position] = "X"
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = "O"
end

def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if b[line[0]] == "X" and b[line[1]] == "X" and b[line[2]] == "X"
      return "Player"
    elsif b[line[0]] == "O" and b[line[1]] == "O" and b[line[2]] == "O"
      return "Computer"
    end
  end
   else
     return nil
end

board = initialize_board(board)
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty? 
  
if winner
  puts "#{winner} wins!"
else
  puts "it's a tie!"
end

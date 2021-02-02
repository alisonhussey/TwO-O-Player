class Game
  def initialize(p1, p2, q)
    @player_1 = p1
    @player_2 = p2
    @question = q
    @current_player = @player_1
    @current_question_index = 0
  end

  def start
    while @player_1.lives > 0 && @player_2.lives > 0
      ask_question()
    end
  end

  def ask_question()
    @new_question = Question.new
    puts "#{@current_player.name}: #{@new_question.question}"
    print "> "
    choice = $stdin.gets.chomp.to_i
    if choice == @new_question.answer
      puts "Yes! You are correct."
    else
      @current_player.lives -= 1
      puts "Seriously? No!"
    end 
    puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
    if @player_1.lives == 0 
      puts "Player 2 wins with a score of #{@player_2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    elsif @player_2.lives == 0
      puts "Player 1 wins with a score of #{@player_1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else
      puts "----- NEW TURN -----"
      update_player()
    end
  end

  def update_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
end








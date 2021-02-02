class Game
  def initialize(p1, p2, qs)
    @player_1 = p1
    @player_2 = p2
    @questions = qs
    @current_player = @player_1
    @current_question_index = 0
  end

  def start
    # ask_question()
    while @player_1.lives > 0 && @player_2.lives > 0
      ask_question()
    end
  end

  def update_question_index
    if @current_question_index < @questions.length - 1
      @current_question_index += 1
    else
      @current_question_index = 0
    end
    puts @current_question_index
    puts @questions.length
  end
    
  def generate_question
    takes a random number
  end

  def ask_question()
    puts "#{@current_player.name}: #{@questions[@current_question_index].question}"
    print "> "
    choice = $stdin.gets.chomp
    if choice == @questions[@current_question_index].answer
      puts "You win"
    else
      @current_player.lives -= 1
      puts "You lose, your lives: #{@current_player.lives}"
    end 
    update_player()
    update_question_index()
  end

  def update_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end

class Player 
  attr_accessor :lives, :name
  def initialize(name)
    @name = name
    @lives = 3
  end
end

class Question
  attr_accessor :question, :answer
  def initialize(q, a)
    @question = q
    @answer = a

  end
end

player_1 = Player.new("Player 1")
player_2 = Player.new("Player 2")
question_1 = Question.new("What does 5 plus 3 equal?", "8")
question_2 = Question.new("What does 2 plus 4 equal?", "6")
all_questions = []
all_questions << question_1 
all_questions << question_2
# print all_questions
game1 = Game.new(player_1, player_2, all_questions)
# puts game1.inspect

# game1.ask_question

game1.start

class Question
  attr_accessor :question, :answer
  def initialize
    @random_1 = rand(1..10)
    @random_2 = rand(1..10)
    @question = "What does #{@random_1} plus #{@random_2} equal?"
    @answer = @random_1 + @random_2
  end
end
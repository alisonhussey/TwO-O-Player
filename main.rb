require "./GameLoop.rb"
require "./Player.rb"
require "./Question.rb"





player_1 = Player.new("Player 1")
player_2 = Player.new("Player 2")
q = Question.new
game1 = Game.new(player_1, player_2, q)
game1.start


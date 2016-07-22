require 'colorize'
require 'pry-byebug'
require './player'
require './game'

print "Enter name of first player: ".white
user_name = gets.strip
player_1 = Player.new(user_name)

print "Enter name of second player: ".white
user_name = gets.strip
player_2 = Player.new(user_name)

game = Game.new(player_1, player_2)

while !game.game_over
  print game.generate_round_numbers
  user_response = gets.strip.to_i
  game.check_answer_and_evaluate_game(user_response)
end

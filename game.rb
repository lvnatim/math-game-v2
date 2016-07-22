require 'colorize'
require './player'

class Game

  attr_reader :game_over

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @correct_answer = nil
    @game_over = false
  end

  def change_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def generate_round_numbers
    number_1 = Random.new.rand(20)
    number_2 = Random.new.rand(20)
    math_syms = [:+, :-, :*]
    random_math_sym = math_syms.sample
    @correct_answer = number_1.send(random_math_sym, number_2)
    puts "It is #{@current_player.name}'s turn!".white
    "What is #{number_1} #{random_math_sym} #{number_2}? ".white
  end

  def check_answer_and_evaluate_game(answer)
    if answer == @correct_answer
      @current_player.add_point
      puts "Correct! #{@current_player.name} now has #{@current_player.points} points.".green
      puts "Changing player...".white
      puts line_break
      change_player
    else
      @current_player.lose_life
      if @current_player.no_lives_left?
        puts "No lives left! Game over!".red
        change_player
        puts "#{@current_player.name} wins with #{@current_player.points} points!".green
        reset_or_game_over
      else
        puts "Incorrect! The correct answer was #{@correct_answer}. Changing player...".red
        puts line_break
        change_player
      end
    end
  end

  def line_break
    ""
  end

  def reset_or_game_over
    print "Would you like to play again? (Y for YES)".white
    input = gets.strip.upcase

    if input == 'Y'
      @player_1.reset
      @player_2.reset
      game_reset
      puts line_break
    else
      @game_over = true
    end
  end

  def game_reset
    @current_player = @player_1
    @correct_answer = nil
    @game_over = false
  end

end

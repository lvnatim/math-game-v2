class Player

  attr_reader :lives, :points, :name

  def initialize(name)
    @name = name
    @lives = 3
    @points = 0
    puts "#{name} player initialized with #{@lives} lives and #{@points} points"
    puts ""
  end

  def add_point
    @points += 1
  end

  def lose_life
    @lives -= 1
    puts "#{@name} has #{@lives} lives left.".red
  end

  def no_lives_left?
    @lives == 0 ? true : false
  end

  def reset
    @lives = 3
    @points = 0
  end

end

require './dictionary.rb'

class Game
  def initialize
    @word_set = Dictionary.clean('5desk.txt')
    @word = @word_set.sample
    @lines = Array.new(@word.length, "_ ")
    @@turns = 6
    game_start
  end

  private

  def game_start
    system "clear"
    start_message
    print_lines
  end

  def start_message
    puts "*********************************************************************"
    puts "*                            HANGMAN                                *"
    puts "*                                                                   *"
    puts "*      Welcome to a command line implementation of the classic      *"
    puts "* game, written in Ruby! Try to guess the secret word, but beware!  *"
    puts "*                   You only have 6 guesses!                        *"
    puts "*********************************************************************"
    puts ""
  end

  def print_lines
    puts @lines.join
  end

end

x = Game.new

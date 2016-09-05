require './dictionary.rb'

class Game
  def initialize
    @word_set = Dictionary.clean('5desk.txt')
    @word = @word_set.sample.split("")
    @lines = Array.new(@word.length, "_ ")
    @user_guess = ""
    @letter_index = []
    @wrong_guesses = []
    @@guesses = 6
    game_start
  end

  private

  def game_start
    begin
      system "clear"
      start_message
      puts "#{@word}"
      game_loop
    end until @@guesses == 0
  end

  def start_message
    puts "*********************************************************************"
    puts "*                            HANGMAN                                *"
    puts "*                                                                   *"
    puts "*      Welcome to a command line implementation of the classic      *"
    puts "* game, written in Ruby! Try to guess the secret word, but beware!  *"
    puts "*                 You only have 6 wrong guesses!                    *"
    puts "*********************************************************************"
    puts ""
  end

  def game_loop
    print_lines
    print_wrong
    remaining_guesses
    prompt_guess
    evaluate_input
    puts @lines
  end

  def print_lines
    print "Your word:  "
    puts "#{@lines.join}"
    puts ""
  end

  def print_wrong
    print "Your wrong guesses: "
    puts @wrong_guesses.sort.join(" ")
    puts ""
  end

  def remaining_guesses
    puts "You have #{@@guesses} guess(es) left."
  end

  def prompt_guess
    print "Your guess: "
    @user_guess = gets.chomp.downcase
  end

  def evaluate_input
    @word.include?(@user_guess) ? index_matches : tally_wrong
  end

  def index_matches
    @word.each_with_index { |el, ind| @letter_index << ind if el == @user_guess }
    @letter_index.each { |num| @lines[num] = "#{@user_guess.upcase} "}
    @letter_index.clear
  end

  def tally_wrong
    @wrong_guesses << @user_guess.upcase
    @@guesses -= 1
  end



end

x = Game.new

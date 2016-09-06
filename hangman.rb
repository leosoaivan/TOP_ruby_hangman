require './dictionary.rb'
require 'json'

class Game
  def initialize
    @word_set = Dictionary.clean('5desk.txt')
    @word = @word_set.sample.upcase.split("")
    @blanks = Array.new(@word.length, "_ ")
    @user_guess = ""
    @letter_index = []
    @wrong_ary = []
    @game_won = false
    @@guesses = 6
    game_start
  end

  private

  def game_start
    game_loop
    ending_msg
    restart
  end

  def start_message
    puts "*********************************************************************"
    puts "*                            HANGMAN                                *"
    puts "*                                                                   *"
    puts "*      Welcome to a command line implementation of the classic      *"
    puts "* game, written in Ruby! Try to guess the secret word, but beware!  *"
    puts "*                 You only have 6 wrong guesses!                    *"
    puts "*********************************************************************"
  end

  def game_loop
    begin
      system "clear"
      start_message
      update_blanks
      blank_lines
      remaining_guesses
      wrong_guesses
      break if !@blanks.include?("_ ")
      prompt_guess
      evaluate_guess
      evaluate_input
    end until @@guesses == 0
  end

  def blank_lines
    puts ""
    print "Your word:  "
    puts "#{@blanks.join}"
    puts ""
  end

  def wrong_guesses
    print "Your wrong guesses: "
    puts @wrong_ary.sort.join(" ")
    puts ""
  end

  def remaining_guesses
    puts "You have #{@@guesses} wrong guess(es) left."
  end

  def prompt_guess
    begin
      print "Your guess: "
      @user_guess = gets.chomp.upcase
    end until /[A-Z]/.match(@user_guess)
  end

  def evaluate_guess
    if @user_guess == "SAVE"
      save_function
    elsif @user_guess == "LOAD"
      load_function
    else
      @user_guess = @user_guess[0]
    end
  end

  def evaluate_input
    @word.include?(@user_guess) ? index_matches : tally_wrong
  end

  def index_matches
    @word.each_with_index { |el, ind| @letter_index << ind if el == @user_guess }
  end

  def tally_wrong
    @wrong_ary << @user_guess
    @@guesses -= 1
  end

  def update_blanks
    @letter_index.each { |num| @blanks[num] = "#{@user_guess} "}
    @letter_index.clear
  end

  def ending_msg
    if @@guesses == 0
      puts "You lost the game!"
      puts "The secret word was #{@word.join.upcase}."
    else
      puts "You won the game!"
    end
    puts ""
  end

  def restart
    print "Would you like to play again? Y/N? "
    input = gets.chomp.upcase
    if input == "Y"
      x = Game.new
    elsif input == "N"
      puts "Goodbye!"
    else
      puts "I didn't get that."
      restart
    end
  end

end

x = Game.new

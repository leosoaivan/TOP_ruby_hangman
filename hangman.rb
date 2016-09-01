require './dictionary.rb'

class Game
  def initialize
    game_start
  end

  private

  def game_start
    system "clear"
    start_message
  end

  def start_message
    puts "*********************************************************************"
    puts "                            HANGMAN                                  "
    puts ""
    puts "                      Welcome to Hangman!"
    puts "   Try to guess the computer's secret 4-character code using the"
    puts " letters A through F. Duplicate letters ARE allowed. Otherwise, make"
    puts "       your own code and see if the computer can guess it."
    puts ""
    puts "                    (It most likely will!)"
    puts "*********************************************************************"
  end

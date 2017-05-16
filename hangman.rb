# This class is the master class.
require_relative "player"
require_relative "gamemaster"

class Hangman

  def initialize

    @player = Player.new
    @gamemaster = Gamemaster.new

  end

  def start #game loop

    @gamemaster.draw(@gamemaster.letters, @player.player_guesses)
    get_guess(@gamemaster.letters)



  end

  def win

    print "\n\nCongratz you won the game\n\n
    Remaining lifes: #{@player.player_lives} \n\n"
  end

  def word_guessed?

    @gamemaster.letters.all? do |letter|
      @player.player_guesses.any? do |player_letter|

        player_letter == letter

      end
    end

  end



  def get_guess(letters)

    while @player.player_lives > 0
      print "Please enter a letter: "
      user_guess = gets.chomp

      if ((letters.include? user_guess) && !(@player.player_guesses.include? user_guess ? false : true))
        @player.player_guesses << user_guess
        print "lives: #{@player.player_lives}"
        if word_guessed?
          win
          exit
        end

      else
        @player.player_lives -= 1
        print "The letter is not in the word your lifes: #{@player.player_lives}"
      end

      @gamemaster.draw(letters, @player.player_guesses)

    end
    print "You have lost the word was #{@gamemaster.word} \n\n"
    exit
  end



end

game1 = Hangman.new

game1.start

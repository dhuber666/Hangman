# This class asks one player to enter a word to guess and then draw the word

class Gamemaster

  attr_reader :letters
  attr_reader :word

  def initialize
    @word = get_word
    @letters = @word.split("")
  end

  def get_word
    print "Please enter a word: "
    return gets.chomp
  end

  def draw(letters, player_letters)
    print "\n\n"
    letters.each do |letter|
      if player_letters.include? letter
        print("#{letter}")
      else
        print "_"
      end
    end
    print "\n\n"
  end






end

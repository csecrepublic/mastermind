#-----PEG CLASS-----
class Peg
    attr_accessor :color

    def initialize(c)
        @color = c
    end

    def to_s
        color
    end
end

#-----PEGCODE CLASS-----
class PegCode
    attr_accessor :pegArr
    attr_reader :COLORS, :NUM_COLORS, :RANDOM

    def initialize
        @COLORS = ["red", "orange", "yellow", "green", "blue", "purple", "pink"]
        @NUM_COLORS = self.COLORS.length
        @RANDOM = Random.new
        @pegArr = []
        
        4.times do
            color = self.COLORS[self.RANDOM.rand(self.NUM_COLORS)]
            peg = Peg.new(color)
            pegArr.push(peg)
        end
    end

    def getColorArr
        colorArr = pegArr.map { |peg| peg.color }
        colorArr
    end

    def to_s 
        str = ""
        pegArr.each do |peg| 
            str += peg.to_s + "\n"
        end
        "Your code is:\n" + str
    end
end

#-----GAME CLASS-----
class Game
    attr_accessor :gameCode, :correctArr
    attr_reader :NUM_ROUNDS

    def initialize
        @gameCode = PegCode.new
        @NUM_ROUNDS = 12
        @correctArr = Array.new(4, false)
    end

    def playOneRound
        guessCount = 1
        guessArr = []

        while guessCount <= 4 do
            puts "What color is peg " + guessCount.to_s + "?"
            thisColor = gets.chomp
            guessArr.push(Peg.new(thisColor))
            guessCount += 1
        end

        puts "\n\n"

        guessArr.each_with_index do |peg, index|
            if peg.color == gameCode.getColorArr[index]
                puts "CORRECT: Peg " + (index+1).to_s + " is " + peg.color
                self.correctArr[index] = true;
            elsif gameCode.getColorArr.include?(peg.color)
                puts "ALMOST: The code does include " + peg.color + ", but not at peg " + (index+1).to_s
            else
                puts "WRONG: The code does not include " + peg.color
            end
        end
    end

    def play
        displayInitialMessage

        self.NUM_ROUNDS.times do
            playOneRound

            if self.correctArr.all?(true)
                puts "\n\nCongratulations! You guessed the code correctly. " + gameCode.to_s
                break
            else
                puts "\n\nLet's try again...\n\n"
            end
        end
    end

    def displayInitialMessage
        puts "Welcome to Mastermind. The computer has 4 pegs, each one a random color."
        puts "You have to guess what color each of the pegs are, in the correct order."
        puts "You have 12 rounds to guess the computer's secret code."
        puts "Can you beat our machine overlords?"
        puts "Your color choices are red, orange, yellow, green, blue, purple, and pink."
        puts "\n\nSTARTING PLAY...\n-----------------------------------"
    end
end

game = Game.new
game.play

#error handling for unknown colors
#create computer player
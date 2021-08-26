# Mastermind
A command-line version of "Mastermind", a game where the user guesses the computer's 4-color code.

## Description
Mastermind is a game where one player (in this case, the computer) creates a 4-peg code using different colors. The other player (in this case, the user) must guess the color of each peg in the code.

There are separate classes for Peg, PegCode, and Game. The computer picks 4 random colors from an array of colors to create a PegCode. The user is given a list of potential colors, then prompted to input their guesses for each Peg color in the command line. They receive feedback for each round: whether their guess was correct; whether the color was correct, but the placement was wrong; or whether their guess was incorrect, and the color is not in the code at all.

This game was designed using The Odin Project's Mastermind project guidelines (linked below). I practiced building a class, modularizing functions, and basic system design.

## Technologies
* Ruby

## Issues & ideas
* Add a UI
* Refactor winning methods for better code reuse
* Let user choose to guess, or create the code and have the computer guess
* Error handling for color guesses that are not in the color array
* Let user skip pegs that they've already guessed correctly

## Instructions
If you have Ruby installed, you can download the Game.rb file and run the game from the command line using `ruby Game.rb`.

## Credits
This was designed using [The Odin Project's Mastermind project guidelines](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/mastermind). Credit to the awesome folks at TOP!


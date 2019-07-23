require 'pry'
require_relative 'player'

class Game
  attr_accessor :human_player
  attr_accessor :ennemies
  def initialize(name_to_save)
    ennemies = []
    ennemies << player1 = Player.new('Jeanne')
    ennemies << player2 = Player.new('Paul')
    ennemies << player3 = Player.new('Carole')
    ennemies << player4 = Player.new('Bender')
    user = HumanPlayer.new('Wolverine')
    @name = name_to_save
    @life_points = 10
  end
end

binding.pry
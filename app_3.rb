require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------------------------"
puts "|Bienvenue sur 'LA CASTAGNE LE SANG DE TES MORTS' !      |"
puts "|Le but du jeu est d'être le dernier survivant !         |"
puts "----------------------------------------------------------"
puts "\n"
puts "\n"
puts "Donne moi ton nom joueur"
print ">"
@player_name = gets.chomp
game = Game.new("#{@player_name}")
tour = 0

puts "Passons à la phase d'attaque :"
while game.is_still_ongoing?
  tour += 1
  puts "\n"
  puts "------Tour #{tour}------"
  puts "\n"
  game.new_players_in_sight
  game.show_player
  game.menu
  game.menu_choice(gets.chomp)
  game.enemies_attack
end
game.end
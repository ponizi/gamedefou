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
name = gets.chomp
my_game = Game.new("#{name}")
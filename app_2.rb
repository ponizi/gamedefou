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
user = HumanPlayer.new("#{name}")
players = []
players << player1 = Player.new("Josiane")
players << player2 = Player.new("José")
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "Voici l'état de ton joueur :"
  puts user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "\n"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  choix = gets.chomp
  puts "\n"
  if choix == "a"
    user.search_weapon
  elsif choix == "s"
    user.search_health_pack
  elsif choix == "0"
    user.attacks(player1)
  elsif choix == "1"
    user.attacks(player2)
  end
  puts "Les ennemis t'attaquent !"
  players.each do |player|
    if player.life_points > 0
    player.attacks(user)
    end
  end
end

puts "La partie est terminée"
if player1.life_points <= 0 && player2.life_points <= 0
  puts "BRAVO ! TU AS WIN"
elsif player1.show_state <= 0
  puts "Loser ! Tu as perdu ! Too bad"
end


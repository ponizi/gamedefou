require 'bundler'
Bundler.require

class Game
  attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight
  $name = ["Howard" , "Johnson" , "Wallace" , "Mills" , "Erin" , "Kenneth" , "Mirian" , "Josefa" , "Bette" , "Roselee" , "Maida" , "Whitney" , "Kareem" , "Jerrold" , "Marc" , "Elmira" , "Elisa" , "Lachelle" , "Cheree" , "Cecile" , "Page" , "Mertie" , "Jackie" , "Brendan"]
  def initialize(name)
    @human_player = HumanPlayer.new("#{name}")
    @players_left = 10
    @enemies_in_sight = []
  end

  def kill_player(player)
    @enemies_in_sight.delete(player)
    @players_left -= 1
  end
  
  def is_still_ongoing?
    if @players_left != 0 && @human_player.life_points > 0
      return true
    else return false
    end
  end

  def show_player
    @human_player.show_state
    puts "Il y a encore #{@players_left} bots présents"
    puts "Il y a #{@enemies_in_sight.count} bots en vue"
  end
  
  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "\n"
    puts "Attaquer un joueur en vue :"
    @enemies_in_sight.each_with_index do |enemie, index|
      if enemie.life_points > 0
        puts "#{index} - #{enemie.show_state}"
      end
    end
    print "> "
  end

  def menu_choice(action)
    @enemies_in_sight.each_with_index do |enemie, index|
      if action == "a"
        @human_player.search_weapon
      elsif action == "s"
        @human_player.search_health_pack
      elsif action == "#{index}"
        @human_player.attacks(enemie)
      end
    end
  end

  def enemies_attack
    puts "\n"
    puts "Les autres joueurs t'attaquent !"
    @enemies_in_sight.each do |enemie|
      if enemie.life_points > 0
        enemie.attacks(@human_player) 
      else
        self.kill_player(enemie)
      end
    end
  end

  def new_players_in_sight
    if @enemies_in_sight.count == @players_left
      puts "Tous les joueurs sont déjà en vue"
    elsif @enemies_in_sight.count < @players_left
      dice = rand(1..6)
      if dice == 1
        puts "Aucun nouvel ennemie arrive"
      elsif dice >=2 && dice <= 4
        @enemies_in_sight << Player.new($name.sample)
        puts "Un nouvel ennemie arrive"
      elsif dice >= 5
        numerous_enemies = 2
        numerous_enemies.times do |i|
        @enemies_in_sight << Player.new($name.sample)
        end
        puts "#{numerous_enemies} nouveaux ennemies arrivent"
      end
    end
  end

  def end
    puts "\n"
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !" 
    end
  end
end
require 'pry'

class Player
  attr_accessor :name
  attr_accessor :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end


  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "#{@name} a été tué :'("
    end
  end

  def attacks(player)
    damage = compute_damage
    puts "#{@name} attaque #{player.name}"
    puts "Il lui inflige #{damage} points de dégâts"
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_to_save)
    @weapon_level = 1
    @name = name_to_save
    @life_points = 100
  end

  def compute_damage
  return  rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else puts "M@*#$... elle n'est pas mieux que ton arme actuelle... tu gardes la précédente"
    end
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1 
      puts "Tu n'as rien trouvé"
    elsif health_pack <= 5 && health_pack != 1 
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if @life_points > 100 
        @life_points = 100
      end
    elsif health_pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points > 100 
        @life_points = 100
      end
    end
  end


end


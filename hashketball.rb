# Write your code here!
require 'pry'

def game_hash
  nba_hash = {
    :home => {
      :team_name =>["Brooklyn Nets"],
      :colors =>["Black", "White"],
      :players => {
         "Alan Anderson" => {
           :number => 0,
           :shoe => 16,
           :points => 22,
           :rebounds => 12,
           :assists => 12,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 1
         },
         "Reggie Evans" => {
           :number => 30,
           :shoe => 14,
           :points => 12,
           :rebounds => 12,
           :assists => 12,
           :steals => 12,
           :blocks => 12,
           :slam_dunks => 7
         },
         "Brook Lopez" => {
           :number => 11,
           :shoe => 17,
           :points => 17,
           :rebounds => 19,
           :assists => 10,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 15
         },
         "Mason Plumlee" => {
           :number => 1,
           :shoe => 19,
           :points => 26,
           :rebounds => 12,
           :assists => 6,
           :steals => 3,
           :blocks => 8,
           :slam_dunks => 5
         },
         "Jason Terry" => {
           :number => 31,
           :shoe => 15,
           :points => 19,
           :rebounds => 2,
           :assists => 2,
           :steals => 4,
           :blocks => 11,
           :slam_dunks => 1
         }
       }
    },
    :away => {
      :team_name =>["Charlotte Hornets"],
      :colors =>["Turquoise", "Purple"],
      :players => {
         "Jeff Adrien" => {
           :number => 4,
           :shoe => 18,
           :points => 10,
           :rebounds => 1,
           :assists => 1,
           :steals => 2,
           :blocks => 7,
           :slam_dunks => 2
         },
         "Bismak Biyombo" => {
           :number => 0,
           :shoe => 16,
           :points => 12,
           :rebounds => 4,
           :assists => 7,
           :steals => 7,
           :blocks => 15,
           :slam_dunks => 10
         },
         "DeSagna Diop" => {
           :number => 2,
           :shoe => 14,
           :points => 24,
           :rebounds => 12,
           :assists => 12,
           :steals => 4,
           :blocks => 5,
           :slam_dunks => 5
         },
         "Ben Gordon" => {
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
         },
         "Brendan Haywood" => {
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 22,
           :blocks => 5,
           :slam_dunks => 12
         }
      }
    }
  }
end

def num_points_scored(name)
  points_scored = []
  game_hash.each do |key, value|
    value.each do |attribute, data|
      data.each do |player, stats|
        if player == name
          stats.each do |stat, number|
            if stat == :points
              points_scored = number
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(name)
  shoes = []
  game_hash.each do |key, value|
    value.each do |attribute, data|
      data.each do |player, stats|
        if player == name
          stats.each do |stat, number|
            if stat == :shoe
              shoes = number
            end
          end
        end
      end
    end
  end
  shoes
end

def team_colors(team)
  colors = []
  game_hash.each do |key, value|
      value.each do |attribute, data|
        if data.flatten.join == team
          colors = game_hash[key][:colors]
        end
    end
  end
  colors
end

def team_names
  team_name_array = []
  team_name_array << game_hash[:home][:team_name].join
  team_name_array << game_hash[:away][:team_name].join
  team_name_array
end

def player_numbers(team)
  numbers = []
  game_hash.each do |key, value|
    value.each do |attribute, data|
      if game_hash[key][:team_name].join == team
        if attribute == :players
          data.each do |player, stats|
            stats.each do |stat, number|
              if stat == :number
                numbers << number
              end
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats_hash = {}
  game_hash.each do |key, value|
    value.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            stats.each do |key1, value1|
                stats_hash[key1] = value1
            end
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  shoe_sizes = []
  rebound_array = []
  game_hash.each do |key, value|
    value.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
            stats.each do |key1, value1|
                if key1 == :shoe
                  shoe_sizes << value1
            end
          end
        end
      end
    end
  end
# Created array of shoe sizes.
# Create value with biggest shoe size
  biggest_shoe = shoe_sizes.sort.reverse[0]
  biggest_shoe_player = ""
  biggest_shoe_home_or_away = ""

# Will now iterate through data to find who biggest_shoe belongs to
  game_hash.each do |key, value|
    value.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |key1, value1|
            if key1 == :shoe
              if value1 == biggest_shoe
                biggest_shoe_player = player
                biggest_shoe_home_or_away = key
              end
            end
          end
        end
      end
    end
  end
  game_hash[biggest_shoe_home_or_away][:players][biggest_shoe_player][:rebounds]
end


big_shoe_rebounds()

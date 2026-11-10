# This module handles all the saving and loading of games using FEN
module FEN
  def self.saved_games
    unless Dir.exist? "saves"

      puts "No saved games."
      return
    end

    puts "\n Save files\n\n"

    valid_entries = []
    Dir.entries("saves").each do |file|
      if file != "." && file != ".."
        puts file.delete_suffix(".txt")
        valid_entries.push(file.delete_suffix(".txt"))
      end
    end

    puts "\n Pick a save\n\n"
    selection = "#{UI.get_user_input(valid_entries)}.txt"

    puts "\n 1 - play\n 2 - delete\n\n"
    action = UI.get_user_input(1, 2)

    case action.to_i
    when 1 then play_save(selection)
    when 2 then delete_save(selection)
    end
  end

  def self.delete_save(name)
    File.delete("saves/#{name}")
    Dir.rmdir("saves") if Dir.empty?("saves")
  end

  def self.play_save(name)
    save_data = File.read("saves/#{name}")
    game_from_fen(save_data)
  end

  def self.game_from_fen(fen)
    puts fen
  end
end

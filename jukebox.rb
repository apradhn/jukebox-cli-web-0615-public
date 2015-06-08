require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

# Your code here
def run(songs)
  command = prompt_user
  unless command == "exit"
    if command == "help"
      help
      command = prompt_user
    elsif command == "list"
      list(songs)
    elsif command == "play"
     play(songs)
    end
  end
  exit_jukebox
end

def prompt_user
  puts "Please enter a command:"
  command = gets.strip  
end

def help
  puts "I accept the following commands"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each.with_index {|song, i| puts "#{i+1}. #{song}" }
end

def exit_jukebox
  puts "Goodbye!"
end

def play(songs)
  command = gets.strip
  if /[d]/.match(command)
    puts "Playing #{songs[command.to_i-1]}"
  elsif songs.any?{|song| song.include?(command)}
    title = songs.find {|song| song.include?(command)}
    puts "Playing #{title}"
  else
    puts "Invalid input, please try again"
  end
end
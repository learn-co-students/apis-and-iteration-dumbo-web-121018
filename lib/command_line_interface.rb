def welcome
  puts "Welcome"
end

def get_character_from_user
  puts "please enter a character name"
  character = gets.chomp.split.map(&:capitalize).join(' ')
  character
end

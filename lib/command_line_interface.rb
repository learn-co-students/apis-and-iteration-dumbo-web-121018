def welcome
  puts "Welcome to the Star Wars API"
end

def get_character_from_user
  puts "please enter a character name"
  answer = gets.chomp.downcase.split.map(&:capitalize).join(' ')
  answer
end

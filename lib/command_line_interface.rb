def welcome
  puts "Welcome! Enter a Star Wars character to search!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
end

def welcome
  # puts out a welcome message here!
  "Welcome you nerd!"
end

def get_character_from_user
  puts "Please enter a Star Wars character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp.downcase
end

def welcome
  # puts out a welcome message here!
  puts "Welcome to the Starwars API!"
end

def get_character_from_user
  puts "please enter a character name"
  character_name = gets.chomp
  character_name.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

def new_query
	puts "Would you like to make a new query?"
	user_input = gets.chomp.downcase
	if user_input != "yes" && user_input != "no"
		puts "Invalid Entry. Please type 'Yes or No'"
		user_input = gets.chomp.downcase
	elsif user_input == "yes"
		character = get_character_from_user
		show_character_movies(character)
		new_query
	elsif user_input == "no"
		exit
	end
end 


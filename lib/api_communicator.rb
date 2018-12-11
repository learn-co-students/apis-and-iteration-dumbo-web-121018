require 'rest-client'
require 'json'
require 'pry'

# HELPER METHOD
def parse_url(url)
  response_string = RestClient.get(url)
  return JSON.parse(response_string)
end

# Returns an array of films where the character appeared.
def get_character_movies_from_api(character_name)
  array_of_characters = parse_url('http://www.swapi.co/api/people')["results"]
  character_index = array_of_characters.find_index do |character_hash|
    character_hash["name"].downcase == character_name.downcase
  end
  array_of_films = array_of_characters[character_index]["films"]
  array_of_films.map do |film_url|
    parse_url(film_url)
  end
end

# Prints of the list of films in a neat format.
def print_movies(films)
  puts "List of Movies"
  films.each do |film|
    puts ""
    puts "Title: #{film["title"]}"
    puts "Episode: #{film["episode_id"]}"
    puts "Release Date: #{film["release_date"]}"
    puts "-----"
  end
end

# Gets an array of films annd runs print_movies to print the list.
def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

#show_character_movies("luke skywalker")

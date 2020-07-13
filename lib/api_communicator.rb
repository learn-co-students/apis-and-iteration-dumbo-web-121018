require 'rest-client'
require 'json'
require 'pry'

def get_character_movie_links_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  films_urls = []
  response_hash["results"].each do |character|
    if character["name"].downcase == character_name
       films_urls = character["films"]
    end
  end
  films_urls
end

#refactored method for previously defined get_character_movies_from_api
def get_film_hashes(film_links)
  films_hash_array = []
  film_links.each do |url|
    response = RestClient.get(url)
    films_hash_array << JSON.parse(response)
  end
  films_hash_array
end


def sort_films_by_episode(films_hash_list)
  films_hash_list.sort_by {|film| film["episode_id"]}
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  puts ""
  puts "That character was in..."
  films = sort_films_by_episode(films)
  films.each do |film|
    puts "Star Wars #{convert_to_roman_numerals(film["episode_id"])} #{film["title"]}"
  end
end

def show_character_movies(character)
  links = get_character_movie_links_from_api(character)
  films = get_film_hashes(links)
  print_movies(films)
end
## BONUS

def convert_to_roman_numerals(number)
  roman = ""
  roman_numbers_hash = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I",
  }
  roman_numbers_hash.each do |value, letter|
    roman << letter * (number / value)
    number = number % value
  end
  roman
end
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

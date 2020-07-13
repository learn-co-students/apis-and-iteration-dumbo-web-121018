require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  films = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  person_hash = response_hash["results"]
   person_hash.each do |item|
     if item["name"] == character_name
      films << item["films"]
    end
  end
  return films
end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  list_films = []
  films.each do |item|
    item["title"]
     list_films << item["title"]
     end
     list_films
     binding.pry
end


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end



# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

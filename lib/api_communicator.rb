require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name) # => array of hashes of movies

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  film_hash_array = []

  response_hash["results"].map do |person|
    if person["name"].downcase == character_name
      film_hash_array = person["films"].map do |film|
        film_string = RestClient.get(film)
        film_hash = JSON.parse(film_string)
        # film_hash_array << film_hash
      end
    end
  end
  film_hash_array
end


def print_movies(films)
  films.map do |movie_info|
    puts movie_info["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)

  film_hashes = []
  response_string = RestClient.get('http://www.swapi.co/api/people')
  response_hash = JSON.parse(response_string)
  names_array = response_hash["results"]
  names_array.each do |person_hash|
    if person_hash["name"] == character_name
      my_films = person_hash["films"]

      my_films.each do |film|
        response = RestClient.get film
        json_film = JSON.parse response
        film_hashes << json_film

      end
    end
  end
  film_hashes

end

def print_movies(films)
  end_array = []
  films.each do |film|
    end_array << film["title"]
  end
  return end_array
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts print_movies(films).inspect
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

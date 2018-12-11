require 'rest-client'
require 'json'
require 'pry'

# def get_character_movies_from_api(character_name)
#   #make the web request
#   response_string = RestClient.get('http://www.swapi.co/api/people/')
#   response_hash = JSON.parse(response_string)
#   characters_arr = response_hash["results"]
#
#   character_idx = nil
#   characters_arr.each_with_index do |hash,idx|
#     if hash["name"] == character_name
#       character_idx = idx
#     end
#   end
#
#   arr_of_films = characters_arr[character_idx]["films"]
#
#   arr_of_hashes = []
#   arr_of_films.each do |film_url|
#     film_str = RestClient.get(film_url)
#     film_hash = JSON.parse(film_str)
#     arr_of_hashes << film_hash
#   end
#   return arr_of_hashes
#   # make the web request
#   # iterate over the response hash to find the collection of `films` for the given `character`
#   #   `character`
#   # collect those film API urls, make a web request to each URL to get the info
#   #  for that film
#   # return value of this method should be collection of info about each film.
#   #  i.e. an array of hashes in which each hash reps a given film
#   # this collection will be the argument given to `print_movies`
#   #  and that method will do some nice presentation stuff like puts out a list
#   #  of movies by title. Have a play around with the puts with other info about a given film.
# end

# puts get_character_movies_from_api("Luke Skywalker")
# puts ""
def parse_url(url)
  response_str = RestClient.get(url)
  characters_arr = JSON.parse(response_str)
end

def get_character_movies_from_api(character_name)
  #make the web request
  characters_arr = parse_url('http://www.swapi.co/api/people/')["results"]
  character_idx = nil
  characters_arr.each_with_index do |hash,idx|
    if hash["name"].downcase == character_name.downcase
      character_idx = idx
    end
  end

  arr_of_films = characters_arr[character_idx]["films"]

  arr_of_films.map do |film_url|
    parse_url(film_url)
  end
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts "Title: #{film["title"]}"
    puts "Episode No: #{film["episode_id"]}"
    puts "Release Date: #{film["release_date"]}"
    puts "----------"
    #binding.pry
  end
end

#show_character_movies("Luke Skywalker")

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

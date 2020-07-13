require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/') # gets info string
  character_hash = JSON.parse(all_characters) # makes info into a readable JSON and put it in a variable (which is a Hash)
  film_urls = nil
  films_hashes = []
  # binding.pry
  character_data = character_hash["results"].each do |data| # in the hash variable, go into "results" and go through each 'data piece'
                                                            # and find the "name" part and save it as a variable called character_name.
    if character_name.downcase == data["name"].downcase                               #  <------------
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
    film_urls = data["films"] # WRONG!
    # binding.pry
    # iterate over the response hash to find the collection of `films` for the given
    #   `character`

    film_urls.each do |film|
      films_hashes << JSON.parse(RestClient.get(film))

      end
    end
  end
  films_hashes

 # return value of this method should be collection of info about each film.
 #  i.e. an array of hashes in which each hash reps a given film
 # this collection will be the argument given to `print_movies`
 #  and that method will do some nice presentation stuff like puts out a list
 #  of movies by title. Have a play around with the puts with other info about a given film.
end



def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film_data|
    puts film_data["title"]
  end
end



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

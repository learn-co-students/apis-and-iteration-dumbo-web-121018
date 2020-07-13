require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  #gets the info from the server
  response_hash = JSON.parse(response_string)
  #parse makes it readable
# wont run because its inside a function
#need to call function first
films = response_hash["results"][0]["films"]
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  films.map { |film| JSON.parse(RestClient.get(film)) }
    #creates the get request
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end
#puts get_character_movies_from_api("Yoda")

#gives us array of titles from our array of hashes

def print_movies(films)
  films.map {|movies| movies["title"] }
end
#puts print_movies(get_character_movies_from_api("Yoda"))
    # iterate over hash to access movie title values to be put in a list
    #map, collect, select put out a new array
  # some iteration magic and puts out the movies in a nice list
#our array of hashes for each film is used as an argument for our method to print

def show_character_movies(character)
  #define our method that takes in an argument of character
  films = get_character_movies_from_api(character)
  #create a variable films which stores our array of hashes
  print_movies(films)
  #we call our method which prints out movie titles for the specific charcter thats put in our method
end
puts show_character_movies("Yoda")
#call our method with the character name Yoda which will print all of his movie titles
#must call function in order for anything to happen in program

#use binding.pry to check for errors
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


  output = []
  character_hash["results"].each do |description|
    description.map do |keys, values|
      if values == character
        output << description["films"]
      end
    end
  end
  output = output.flatten
  output

  #return film_titles

end #get_character_movies_from_api


def parse_character_movies(film_hash)
  # arr = []
  films = film_hash.map do |film_url|
    film_api = RestClient.get(film_url)
    parsed_films = JSON.parse(film_api)
    puts parsed_films["title"]
    parsed_films["title"]
  end
  # arr
  # array = []
  # i = 0
  # while i < output.length
  #   output[i]
  #   array << JSON.parse(RestClient.get(output[i]))['title']
  #   i+=1
  # end
  # # list = ""
  # # array.each do |title|
  # #   list += title
  # # end
  # # list
  # array

end




def show_character_movies(character)
  output = get_character_movies_from_api(character)
  parse_character_movies(output)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

require 'open-uri'

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies["results"].each do |movie|
  image = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: image, rating: movie["vote_average"])
  puts "movie created"
end


puts "all movies created"

module MoviesHelper
  
  def movie_image(movie)
    if movie.image_url # in the sake of simplicity, showing the uploaded movie takes precedence over url
      movie.image_url.to_s
    else
      movie.poster_image_url
    end
  end
end

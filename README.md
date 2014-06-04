## Rene Cravioto -  Notes

Ok, so it seems that I survived my first experience with Rails.

Interesting learnings:

helper methods can/should be created whenever we need some business logic, presentation logic, etc.
An example is when I decided to keep two options available to provide an image for the movie: url link or file upload and display one or the other depending on which one is present. To keep things simple, if we a file has been uploaded this takes precedence and the url image is never displayed.

Improvements: -> I guess instead of having the helper return the image_url maybe this helper method should return the complete 


So I created a helper method called 

  module MoviesHelper
    
    def movie_image(movie)
      if movie.image
        movie.image_url.to_s
      else
        movie.poster_image_url
      end
    end
  end

## helpers 
are created automatically for each controller that we ask rails to create for us (see app/helpers folder)
these methods are made available (accessible) from withing their corresponding conrollers
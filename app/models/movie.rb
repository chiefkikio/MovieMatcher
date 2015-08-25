class Movie < ActiveRecord::Base
	has_many :actors, dependent: :destroy
	after_create :fill_actors_table
	validates_presence_of :title

	def fill_actors_table
	  # can't figure out how to insert string. :title
	  # "Lion King works"	
	  # I need to access the data from the table but params[:movie][:title] won't work cuz params are only accessible in the controller or the view. 
	  movie_list = Imdb::Search.new("Finding Nemo")
	  new_movie = movie_list.movies.first
	  id = new_movie.id
	  
	  i = Imdb::Movie.new("#{id}")
	  i.cast_members.each do |actor_name|
	    actor_image = Google::Search::Image.new(:query => actor_name, :image_size => :medium).first
		actor_image_url = actor_image.uri
	  	Actor.create(:name => actor_name, :file => actor_image_url, :movie_id => id)
	  end

	end

end

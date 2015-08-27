class Movie < ActiveRecord::Base
	has_many :actors, dependent: :destroy
	after_create :fill_actors_table
	validates_presence_of :title

	def fill_actors_table
	  movie_list = Imdb::Search.new(title)

	  #automatically just goes for the first movie if there are movies with the same name cuz it's a feature. 
	  new_movie = movie_list.movies.first 
	  id = new_movie.id
	  self.imdb_id = id
	  self.save
	  
	  i = Imdb::Movie.new("#{id}")
	  i.cast_members.each do |actor_name|
	    actor_image = Google::Search::Image.new(:query => actor_name, :image_size => :medium).first
		actor_image_url = actor_image.uri
	  	actor =  self.actors.build(:name => actor_name, :file => actor_image_url)
	  	actor.save
	  end
	end

	def find_random_actors
		self.actors.order("RANDOM()").first(5)	
	end

end

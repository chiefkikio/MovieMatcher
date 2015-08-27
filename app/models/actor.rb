class Actor < ActiveRecord::Base
	belongs_to :movie

	def self.find_random_actors
		# where movie_id is id.
		return Actor.order("RANDOM()").first(5)
	end

end

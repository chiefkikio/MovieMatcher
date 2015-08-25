class Actor < ActiveRecord::Base
	belongs_to :movie

	def self.find_random_actors
		return Actor.order("RANDOM()").first(5)
	end

end

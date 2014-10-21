class Iteration
	include Mongoid::Document
	validates :name, presence: true
	validates :start, presence: true
	validates :end, presence: true 
	validate :valid_period?

	field :name, type: String
	field :start, type: Date
	field :end, type: Date

	private
	def valid_period?
		return if self.start.nil? || self.end.nil?
		errors.add(:start,"should be prior or equal to to end date") unless self.start <= self.end
	end
end
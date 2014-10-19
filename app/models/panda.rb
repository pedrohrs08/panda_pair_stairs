class Panda
	include Mongoid::Document
	validates :name, presence: true
	validates :name, uniqueness: true

	field :name, type: String
end
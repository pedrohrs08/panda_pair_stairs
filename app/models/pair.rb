class Pair
  include Mongoid::Document
  validates :first_panda, presence: true
  validates :second_panda, presence: true
  validates :date_of_pairing, presence: true
  
  field :first_panda, type: String
  field :second_panda, type: String
  field :date_of_pairing, type: Date
  field :work_done, type: String
end
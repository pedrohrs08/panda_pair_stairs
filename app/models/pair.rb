class Pair
  include Mongoid::Document
  validates :first_panda, presence: true
  validates :second_panda, presence: true
  validates :date_of_pairing, presence: true
  validate :different_pandas
  validate :valid_pandas
  
  field :first_panda, type: String
  field :second_panda, type: String
  field :date_of_pairing, type: Date
  field :work_done, type: String

  scope :find_within_period,->(start_date,end_date){ where(date_of_pairing: start_date..end_date) }
  private
  def different_pandas
  	errors.add(:first_panda, "first panda should be differant than second panda") if self.first_panda == self.second_panda
  end

  def valid_pandas
  	panda_names = Panda.all.collect(&:name)
  	errors.add(:first_panda,"not included in #{panda_names}") unless panda_names.include?(self.first_panda)
  	errors.add(:second_panda,"not included in #{panda_names}") unless panda_names.include?(self.second_panda)
  end
end
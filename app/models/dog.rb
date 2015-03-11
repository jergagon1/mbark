class Dog < ActiveRecord::Base
  belongs_to :user
  before_save :default_values

  validates :name, presence: true
  validates :description, presence: true

  def default_values
    self.image ||= "http://www.cdc.gov/animalimportation/images/dog2.jpg"
  end

end

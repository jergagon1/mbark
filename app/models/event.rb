class Event < ActiveRecord::Base
  has_many :mbarks
  has_many :users, through: :mbarks

  validate :date_cannot_be_in_past
  validates :time, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :description, presence: true

  def date_cannot_be_in_past
    errors.add(:date, "can't be in the past") if !expiration_date.blank? and expiration_date < Date.today
  end

end
class Hotel < ActiveRecord::Base

  belongs_to :city
  validates :name, uniqueness: true, presence: true
  validates :rating, :city_id, presence: true
end

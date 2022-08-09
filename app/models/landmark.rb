class Landmark < ApplicationRecord
  validates :name, presence: true
  belongs_to :person
  
  has_many :favorites
end

class Landmark < ApplicationRecord
  validates :name, presence: true
  belongs_to :person
end

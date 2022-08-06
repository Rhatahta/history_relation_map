class Person < ApplicationRecord
    validates :name, presence: true
    has_many :landmarks, dependent: :destroy
end

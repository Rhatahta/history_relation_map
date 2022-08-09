class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :landmark

  validates :user_id, uniqueness: { scope: :landmark_id }
end

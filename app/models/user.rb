class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 225 }
  enum role: { general: 0, admin: 1 }

  has_many :favorites, dependent: :destroy
  has_many :landmarks, through: :favorites

  def favorite(landmark)
    landmarks << landmark
  end

  def unfavorite(landmark)
    landmarks.destroy(landmark)
  end

  def favorite?(landmark)
    landmarks.include?(landmark)
  end
end

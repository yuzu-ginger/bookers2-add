class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
    # favorites.where(user_id: user.id).exists?
  end
  
  # バリデーション
  validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end

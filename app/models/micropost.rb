class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites, dependent: :destroy
  
  #Userモデルにmethod記載しなおし
  #has_many :likes, through: :favorites, source: :user
  #def like(user)
  #  self.favorites.find_or_create_by(user_id: user.id)
  #end
  # def unlike(user)
  #  favorite = self.favorites.find_by(user_id: user.id)
  #  favorite.destroy if favorite
  #end
  #def like?(user)
  #  self.likes.include?(user)
  #end
  
end
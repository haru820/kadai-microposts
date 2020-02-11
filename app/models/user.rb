class User < ApplicationRecord
  before_save { self.email.downcase! }
  # ! で自分に破壊的実行
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    #case_sensitive: false 大文字小文字の区別なし
  has_secure_password
  
  #1:Nを明示
  has_many :microposts
  
end

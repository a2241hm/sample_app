class User < ApplicationRecord
  # => User.first
  # => User.all
  # nameカラムに対してpresenceがtrue
  # rails側で強制的に小文字にする。
  # 自分自身のemailかemailの属性なのかわかるように self.emailとする。
  before_save { self.email = self.email.downcase }
  validates :name,  presence: true,
                    length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    # 保存する前に小文字にするので、これは不要
                    # uniqueness: { case_sensitive: false }
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }                  

   # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
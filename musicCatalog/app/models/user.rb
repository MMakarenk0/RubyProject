class User < ApplicationRecord
  has_secure_password
  has_many :playlists

  before_validation :downcase_nickname

  validates :nickname, presence: true, uniqueness: true
  validates :role, presence: true

  def downcase_nickname
    nickname.downcase!
  end
end

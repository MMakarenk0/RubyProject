class Playlist < ApplicationRecord
  before_save :set_default_public_value
  belongs_to :user

  has_and_belongs_to_many :songs

  validates :name, presence: true

  private

  def set_default_public_value
    self.public = false if public.nil?
  end
end

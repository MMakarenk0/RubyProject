class Album < ApplicationRecord
  has_many :songs, dependent: :destroy

  before_save :calculate_duration

  validates :artist, presence: true
  validates :title, presence: true
  validates :release_year, presence: true
  validates :copies, presence: true

  private

  def calculate_duration
    self.duration = songs.sum(:duration) if songs.present?
  end
end

class Artist < ActiveRecord::Base
  belongs_to :user
  validates :full_name, :zip, :music_genre, :country_id, presence: true
end

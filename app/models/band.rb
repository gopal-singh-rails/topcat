class Band < ActiveRecord::Base
  belongs_to :user
  validates :band_name, :zip, :music_genre, :country_id, presence: true
end

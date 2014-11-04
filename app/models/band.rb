class Band < ActiveRecord::Base
  belongs_to :user
  validates :band_name, :zip, :music_genre, :country_id, :user_id, presence: true
  after_create :assign_role

  protected

  def assign_role
    user = self.user
    user.user_type = 2
    user.save
  end
end

class Artist < ActiveRecord::Base
  belongs_to :user
  validates :full_name, :zip, :music_genre, :country_id, presence: true

  after_create :assign_role

  protected

  def assign_role
    user = self.user
    user.user_type = 1
    user.save
  end

end

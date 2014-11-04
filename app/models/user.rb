class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum approve_status: [:pending, :approved]
  enum user_type: [:not_assign, :artist, :band, :client]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :artist, dependent: :destroy
  has_one :client, dependent: :destroy
  has_one :band, dependent: :destroy
  accepts_nested_attributes_for :artist, :band, :client
  validates :terms_of_service, acceptance: { accept: 'yes' }

  scope :not_assign_user, -> { where(user_type: 0)}

  delegate :full_name, to: :artist, prefix: :artist
  delegate :music_genre, to: :artist, prefix: :artist
  delegate :band_name, to: :band
  delegate :music_genre, to: :band, prefix: :band

  delegate :company_name, to: :client, prefix: :client
  delegate :company_email, to: :client, prefix: :client
  delegate :company_email, to: :client, prefix: :client

  def self.approve_user(users_id)
    users = User.where("id in(?)", users_id)
    users.each do |user|
      user.update_attributes(approve_status: 1)
    end
  end

end

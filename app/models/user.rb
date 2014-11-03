class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :artist, dependent: :destroy
  has_one :client, dependent: :destroy
  has_one :band, dependent: :destroy
  accepts_nested_attributes_for :artist, :band, :client
  validates :terms_of_service, acceptance: { accept: 'yes' }
end

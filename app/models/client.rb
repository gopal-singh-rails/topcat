class Client < ActiveRecord::Base
  belongs_to :user
  validates :company_name, :company_email, :official_website, :country_id, :zip, presence: true
end

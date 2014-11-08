class Video < ActiveRecord::Base
  belongs_to :videoable, :polymorphic => true
  validates_presence_of :video_url
end

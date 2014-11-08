class AudioController < ApplicationController
  before_action :authenticate_user!

  def index
    @songs = current_account.songs
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    user = current_user
    user.update_attributes(profile_pic: user_params["profile_pic"])
    redirect_to user_path(current_user)
  end

  def audio
    user = current_user.artist? ? current_artist : current_band
    songlist = {}
    user.songs.map{|song| songlist.merge!(song.audio_file.url => song.audio_file_file_name )}
    @songlist = songlist.to_json
  end

  def upload_audio
    if current_user.artist? or current_user.band?
      if current_user.artist?
        song = current_artist.songs.new(audio_params)
      else
        song = current_band.songs.new(audio_params)
      end
      if song.save
        flash[:message] = "song has been uploaded. It will appear in your list after approve by our staff."
      else
        flash[:error] = song.errors.full_messages.join("<br/>")
      end
      redirect_to artist_audio_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_pic, :audio_file)
  end

  def audio_params
    params.require(:user).permit(:audio_file)
  end
  
end

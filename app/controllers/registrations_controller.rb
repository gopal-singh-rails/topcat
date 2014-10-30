class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: :create
      
  def new
    super
  end

  def user_details
    @klass = (Object.const_get params[:user_type].classify).new
    html = render_to_string(partial: 'artists/artist_details') if @klass.is_a?Artist
    html = render_to_string(partial: 'bands/band_details') if @klass.is_a?Band
    html = render_to_string(partial: 'clients/client_details') if @klass.is_a?Client
    render json: {html: html }
  end

  def check_email
    result = User.where('email=?', params[:email]).blank?
    render json: result 
  end

  def create
    super
  end



=begin
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
=end

  def update
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, artist_attributes: [:full_name, :zip, :music_genre, :country_id])
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :current_password)
    end
  end

end 
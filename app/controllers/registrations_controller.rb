class RegistrationsController < Devise::RegistrationsController
  
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

  def create
    build_resource(sign_up_params) if resource.blank?

    if resource.valid?
      @user = resource
      if params[:user_type].blank?
        user_type_html = render_to_string(partial: 'user_type')
      else
        @klass = (Object.const_get params[:user_type]).new
        render 'artists/artist_details' if @klass.is_a?Artist
        render 'bands/band_details' if @klass.is_a?Band
        render 'clients/client_details' if @klass.is_a?Client
      end
    else
      render 'new'
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

  end


  def update
    super
  end
end 
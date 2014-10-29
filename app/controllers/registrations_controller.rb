class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    build_resource(sign_up_params)
    if resource.valid?
      resource.steps = resource.steps.blank? ? 1 : resource.steps + 1
    else
      render 'new'
    end

    if resource.steps==1
      render 'user_type'
    end

    if resource.steps==2
      unless params[:user_type].blank?
        klass = Object.const_get "Artist".new
      end
      render 'user_details'
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
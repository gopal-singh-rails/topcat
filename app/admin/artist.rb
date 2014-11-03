ActiveAdmin.register Artist do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:artist, :full_name, :music_genre, :zip, :country_id]
  end
  
  form do |f|
    f.inputs "Artist" do
      f.input :user, :collection => User.all.map{|u| [u.email, u.id]}
      f.input :full_name
      f.input :music_genre
      f.select :country_id, collection: Country.all,label: "Country"
      f.input :zip
    end
    f.actions
  end



end

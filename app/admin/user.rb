ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:user, :email,:password]
  end
  
  index do
    column :id
    column :email
    actions
  end
  
  show do |user|
    attributes_table do
      row :id
      row :email
    end
  end

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :password
    end
    f.actions
  end
end

ActiveAdmin.register Video do
  
  actions :all, except: [:new, :show, :create]
  
  
  index do
    column :id
    column "Artist/Band" do |video|
      video.videoable.email
    end
    column "Url" do |video|
      video.video_url
    end
    column :created_at
    column :is_approved
    actions
  end
  
    form do |f|
    f.inputs "Video" do
      f.input :is_approved
    end
    f.actions
  end

end

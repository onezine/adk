ActiveAdmin.register Availability do
  menu :priority => 6, :parent => "Manage"
  config.batch_actions = false
  config.filters = false
  
  index :download_links => false do
    column :name  
    column :allow_click
    default_actions
  end
  
  show do |availability|
    attributes_table do
      row :name
      row :allow_click
      row :image do
        image_tag availability.image.url(:non_retina)
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :allow_click
      f.input :image
    end
    f.buttons
  end
end

ActiveAdmin.register Floorplan do
  menu :priority => 5, :parent => "Manage"
  config.batch_actions = false
  config.filters = false
  
  index :download_links => false do
    column :name  
    default_actions
  end
  
  show do |floorplan|
    attributes_table do
      row :name
      row :image do
        image_tag floorplan.image.url(:non_retina)
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :image
    end
    f.buttons
  end
end

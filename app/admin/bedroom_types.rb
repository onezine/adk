ActiveAdmin.register BedroomType do
  menu :priority => 1, :parent => "Manage"
  config.batch_actions = false
  config.filters = false
  actions :all, :except => [:destroy]
  
  index :download_links => false do
    column :name  
    default_actions
  end
  
  show do |bedroom_type|
    attributes_table do
      row :name
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
    end
    f.buttons
  end
end

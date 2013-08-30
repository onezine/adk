ActiveAdmin.register Block do
  menu :priority => 3, :parent => "Manage"
  config.batch_actions = false
  config.filters = false
  
  index :download_links => false do
    column :name  
    default_actions
  end
  
  show do |block|
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

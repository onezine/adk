ActiveAdmin.register UnitType do
  menu :priority => 2, :parent => "Manage"
  config.batch_actions = false
  config.filters = false
  actions :all, :except => [:destroy]
  
  index :download_links => false do
    column :name  
    default_actions
  end
  
  show do |unit_type|
    attributes_table do
      row :name
      row :bedroom_type
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :bedroom_type
    end
    f.buttons
  end
end

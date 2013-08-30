ActiveAdmin.register AdminUser do       
  filter :email 
  menu :priority => 1
  config.batch_actions = false
  
  index :download_links => false do
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 
  
  show do |user|
    attributes_table do
      row :email
      row :clear_password
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
    end
  end                      

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   

ActiveAdmin.register User do
  menu :priority => 2
  config.batch_actions = false
  filter :email, :label => 'Username'
  
  index :download_links => false do
    column 'Username' do |user|
      user.email
    end
    column :clear_password                    
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 
  
  show do |user|
    attributes_table do
      row 'Username' do
        user.email
      end
      row :clear_password
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
    end
  end                      

  form do |f|                         
    f.inputs "User Details" do       
      f.input :email, :label => 'Username'                 
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end
end

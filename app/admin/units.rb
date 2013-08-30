ActiveAdmin.register Unit do
  config.batch_actions = false
  filter :name
  filter :unit_type
  filter :block
  filter :orientation
  filter :availability
  
  member_action :available do
    unit = Unit.find_by_id(params[:id])
    unit.availability_id = params[:aid]
    unit.save!
    
    flash[:notice] = "Unit has been updated successfully."    
    #render :action => :index
    redirect_to :back
  end
  
  index :download_links => false do
    column :name  
    column :unit_type  
    column :block  
    column :orientation
    column :availability 
    column 'Availability Actions' do |unit|

      links = Availability.all.map { |available| link_to available.name, "units/#{unit.id}/available?id=&aid=#{available.id}" }
      safe_join links, ', '
      #  link_to available.name, 'admin/units/edit_availability'+ " "
      #end
      #link_to('Available!', "units/#{unit.id}/available")
      #link_to('Sold!', "units/#{unit.id}/sold") #publish_admin_district_path(issue)
    end   
    default_actions
  end
  
  show do |unit|
    attributes_table do
      row :name
      row :unit_type
      row :block
      row :orientation
      row :floorplan
      row :availability
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :unit_type
      f.input :block
      f.input :orientation
      f.input :floorplan
      f.input :availability
    end
    f.buttons
  end
end

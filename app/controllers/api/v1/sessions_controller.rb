class Api::V1::SessionsController < Devise::SessionsController
  def create  
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")  
    render :status => 200, :json => { :error => "Success", 'version' => '1.0.6' }  
  end  
  def destroy  
    super
  end
end

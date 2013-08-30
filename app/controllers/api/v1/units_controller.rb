class Api::V1::UnitsController < ApplicationapiController
  before_filter :authenticate_user!
    
  def show
    json = {}
    params = {}
    
    params['bt'] = {}
    json['bt'] = []
    BedroomType.find(:all, :select => "id, name", :order => 'name ASC').map{ |bt| 
      params['bt'][bt.id] = bt.name 
      json['bt'] << bt.name
    }
    
    params['b'] = {}
    json['b'] = []
    Block.find(:all, :select => "id, name", :order => 'name ASC').map{ |b| 
      params['b'][b.id] = b.name 
      json['b'] << b.name
    }
    
    params['ut'] = {}
    UnitType.find(:all, :select => "id, name, bedroom_type_id", :order => 'name ASC').map{ |ut| params['ut'][ut.id] = ut.to_js }
    
    params['f'] = {}
    Floorplan.find(:all, :select => "id, image_file_name, image_updated_at", :order => 'name ASC').map{ |f| params['f'][f.id] = f.to_js } 
  
    params['a'] = {}
    Availability.find(:all, :select => "id, allow_click, image_file_name, image_updated_at", :order => 'name ASC').map{ |a| params['a'][a.id] = a.to_js } 
    json['a'] = params['a']
    
    json['u'] = {}
    Unit.find(:all, :select => "name, unit_type_id, block_id, floorplan_id, availability_id").map{ |u| json['u'][u.name] = u.to_js(params) }
  
    render :json => json.to_json
  end
end

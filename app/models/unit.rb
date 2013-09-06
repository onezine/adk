class Unit < ActiveRecord::Base
  attr_accessible :block_id, :floorplan_id, :name, :orientation_id, :unit_type_id, :availability_id
  belongs_to :block
  belongs_to :floorplan
  belongs_to :orientation
  belongs_to :unit_type
  belongs_to :availability
  
  validates :name, :presence => true 
  validates :unit_type, :presence => true  
  validates :block, :presence => true  
  validates :orientation, :presence => true   
  validates :floorplan, :presence => true  
  validates :availability, :presence => true  
  
  def to_json
    {
      'name' => read_attribute(:name),
      'bedroom_type' => unit_type.bedroom_type.read_attribute(:name),
      'unit_type' => unit_type.read_attribute(:name),
      'block' => block.read_attribute(:name),
      'orientation' => orientation.read_attribute(:name),
      'image' => floorplan.image.url(:non_retina),
      'image_retina' => floorplan.image.url(:retina),
      'available_image' => availability.image.url(:non_retina),
      'available_image_retina' => availability.image.url(:retina),
      'available_click' => availability.read_attribute(:allow_click) ? "1" : "0"
    }
  end
  
  def to_js(params)
    {
      'a' => params['a'][read_attribute(:availability_id)]['n'],
      'ai' => params['a'][read_attribute(:availability_id)]['i'],
      'bt' => params['bt'][params['ut'][read_attribute(:unit_type_id)]['bt']],
      'ut' => params['ut'][read_attribute(:unit_type_id)]['n'],
      'b' => params['b'][read_attribute(:block_id)],
      'i' => params['f'][read_attribute(:floorplan_id)]['i'],
      'n' => read_attribute(:name)
    }
  end
  
end

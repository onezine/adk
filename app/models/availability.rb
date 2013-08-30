class Availability < ActiveRecord::Base
  attr_accessible :allow_click, :name, :image
  has_many :units
  
  validates :name, :presence => true
  validates :image, :presence => true
  has_attached_file :image, :styles => { :retina => '100%x100%', :non_retina => '50%x50%' }
  
  def to_js
    {
      'n' => read_attribute(:allow_click) ? "1" : "0",
      'i' => image.url(:non_retina),
      'ir' => image.url(:retina)
    }
  end
end

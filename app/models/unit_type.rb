class UnitType < ActiveRecord::Base
  attr_accessible :name, :bedroom_type_id
  belongs_to :bedroom_type
  has_many :units
  
  validates :name, :presence => true  
  validates :bedroom_type, :presence => true  
  
  def to_js
    {
      'n' => read_attribute(:name),
      'bt' => read_attribute(:bedroom_type_id)
    }
  end
end

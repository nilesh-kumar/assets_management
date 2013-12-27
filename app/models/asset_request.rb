class AssetRequest < ActiveRecord::Base
  attr_accessible :date, :description, :title, :vendor_id

  #ASSOCIATION

  belongs_to :vendor

  #VALIDATION
  validates :vendor_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

end

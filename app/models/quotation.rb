class Quotation < ActiveRecord::Base
  attr_accessible :accepted, :asset_request_id, :cost, :date, :description, :title, :vendor_id

  #ASSOCIATION

  belongs_to :vendor
  belongs_to :asset_request

  
  #VALIDATION
  
  validates :title, presence: true
  validates :description, presence: true
end

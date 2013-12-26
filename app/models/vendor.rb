class Vendor < ActiveRecord::Base
  attr_accessible :address, :city, :contact_no, :deleted, :deleted_at, :email, :fax_no, :mobile_no, :name, :state, :website

  #ASSOCIATIONS

  has_many :computers, :conditions => ('deleted IS NULL or deleted = false'), :dependent => :destroy

  
  #VALIDATIONS

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :website, presence: true
  validates :website, uniqueness: true


  #SCOPES

  scope :active_vendors, where("deleted IS NULL OR deleted = ?", false)

end

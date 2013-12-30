class Computer < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :invoice_id, :ip_address, :laptop, :computer_number, :os, :os_version, :provider, :vendor_id, :warranty

  #ASSOCIATIONS

  belongs_to :vendor
  belongs_to :invoice
  

  #VALIDATIONS

  validates :computer_number, presence: true
  validates :os, presence: true

end

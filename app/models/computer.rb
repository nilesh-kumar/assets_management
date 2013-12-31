class Computer < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :invoice_id, :ip_address, :laptop, :name, :os, :os_version, :provider, :vendor_id, :warranty

  #ASSOCIATIONS

  belongs_to :vendor
  belongs_to :invoice
  has_many :client_assets, as: :referenceable

  #VALIDATIONS

  validates :name, presence: true
  validates :os, presence: true

end

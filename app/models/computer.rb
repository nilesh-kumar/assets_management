class Computer < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :invoice_id, :ip_address, :laptop, :name, :os, :os_version, :provider, :vendor_id, :warranty

  #ASSOCIATIONS

  belongs_to :vendor
  belongs_to :invoice
  has_many :client_assets, as: :referenceable
  has_many :employee_associations, as: :associable
  has_many :items, :dependent => :destroy

  #VALIDATIONS

  validates :name, presence: true
  validates :os, presence: true

  #SCOPES

  scope :valid_computers, where("deleted IS NULL OR deleted = ?", false)


  #METHODS

  def self.search(search = nil,action)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      if action == "index"
       valid_computers
      end
    end
  end
end

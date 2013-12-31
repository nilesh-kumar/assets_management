class Computer < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :invoice_id, :ip_address, :laptop, :computer_number, :os, :os_version, :provider, :vendor_id, :warranty

  #ASSOCIATIONS

  belongs_to :vendor
  belongs_to :invoice
  has_many :client_assets, as: :referenceable

  #VALIDATIONS

  validates :computer_number, presence: true
  validates :os, presence: true

  #SCOPES

  scope :valid_computers, where("deleted IS NULL OR deleted = ?", false)


  #METHODS

  def self.search(search = nil,action)
    if search
      where('computer_number LIKE ?', "%#{search}%")
    else
      if action == "index"
       valid_computers
      end
    end
  end
end

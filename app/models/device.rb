class Device < ActiveRecord::Base
  attr_accessible :deleted, :deleted_at, :faulty, :faulty_date, :invoice_id, :name, :os, :os_version, :provider, :repaired_date, :returned, :returned_date, :scrap, :stock, :vendor_id, :warranty
  
  #ASSOCIATIONS

  belongs_to :vendor
  has_many :employee_associations, as: :associable
  
  #VALIDATIONS

  validates :name, presence: true
  
  PROVIDER = ["Clarion","Client"]
  
  # Scope goes here #
  scope :inactive, where(:deleted => true)
  scope :active, where("deleted IS NULL OR deleted = ?", false)
  scope :stock, where(:stock => true)
  scope :scrap, where(:scrap => true)
  scope :faulty, where(:faulty => true)
  scope :returned, where(:returned => true)

  # Class method goes here #
  def self.active_and_stock
    active.stock
  end

  def self.active_and_scrap
    active.scrap
  end

  def self.active_and_faulty
    active.faulty
  end

  def self.active_and_returned
    active.returned
  end
  
  # Class method for search #
  def self.search(search = nil,action)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      if action == "deleted"
        inactive
      elsif action == "stock"
        active.stock
      elsif action == "scrap"
        active.scrap
      elsif action == "faulty"
        active.faulty
      elsif action == "returned"
        active.returned
      else
        active
      end
    end
  end
end

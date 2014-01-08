class Item < ActiveRecord::Base
  attr_accessible :branch, :computer_id, :delated, :delated_at,
    :description, :faulty, :faulty_date, :invoice_id, :model_number,
    :name, :peripheral, :provider, :repaired_date, :returned, :returned_date,
    :scrap, :serial_number, :stock, :transferred_from, :transferred_to, :vendor_id,
    :warranty, :device_id, :is_accessory


  #ASSOCIATION

  belongs_to :vendor
  belongs_to :invoice
  belongs_to :computer
  belongs_to :device
  has_many :employee_associations, as: :associable


  #VALIDATION

  validates :vendor_id, presence: true
  validates :name, presence: true
  validates :description, presence: true

  validate :computer_or_device
  
  #SCOPE

  scope :valid_items, where("deleted IS NULL OR deleted = ?", false)


   #METHODS

  def computer_or_device
    if !(computer_id.blank? ^ device_id.blank?)
      errors.add(:base, "Please select computer or device")
    end
  end

  def self.search(search = nil,action)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      if action == "index"
       valid_items
      end
    end
  end

end

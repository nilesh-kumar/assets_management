class Invoice < ActiveRecord::Base
  attr_accessible :cost, :mode, :note, :purchase_date, :purchase_order_id, :serial_number, :vendor_id

  #ASSOCIATION

  belongs_to :vendor
  belongs_to :purchase_order


  #VALIDATION

  validates :vendor_id, presence: true
  validates :serial_number, presence: true
  validates :cost, presence: true
  validates_numericality_of :cost, :unless => Proc.new {|c| c.cost.blank?}


  #METHODS

  def self.search(search = nil,action)
    if search
      where('serial_number LIKE ?', "%#{search}%")
    else
      if action == "index"
       self
      end
    end
  end

end

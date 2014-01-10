class Invoice < ActiveRecord::Base
  attr_accessible :cost, :mode, :note, :purchase_date, :purchase_order_id, :serial_number, :vendor_id
end

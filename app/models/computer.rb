class Computer < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :invoice_id, :ip_address, :laptop, :name, :os, :os_version, :provider, :vendor_id, :warranty
end

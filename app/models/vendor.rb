class Vendor < ActiveRecord::Base
  attr_accessible :address, :city, :contact_no, :deleted, :deleted_at, :email, :fax_no, :mobile_no, :name, :state, :website
end

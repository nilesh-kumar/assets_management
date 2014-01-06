class EmployeeAssociation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :associable, polymorphic: true
  belongs_to :employee

  # Scope goes here #
  scope :computers, where(:associable_type => "Computer")
  scope :devices, where(:associable_type => "Device")
end

class EmployeeAssociation < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :employee_id, :associable_type, :associable_id, :issue_date
  belongs_to :associable, polymorphic: true
  belongs_to :employee

  # Constant for associable type #
  TYPE = ["Computer","Device"]

  # Scope goes here #
  scope :computers, where(:associable_type => "Computer")
  scope :devices, where(:associable_type => "Device")
  default_scope order('created_at DESC')
end

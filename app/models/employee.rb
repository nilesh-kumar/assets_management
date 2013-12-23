class Employee < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :department, :designation, :email_id, :email_password, :employee_number, :helpdesk_id, :helpdesk_password, :join_date, :name, :pandian_id, :pandian_password, :pm_tool_id, :pm_tool_password, :resign_date, :sapience_id, :sapience_password, :skype_id, :skype_password, :technology, :transfered_from, :transfered_to, :wiki_id, :wiki_password
  
  # Validations goes here #
  validates :employee_number, :numericality => {:only_integer => true}
  validates :name, :email_id, :email_password, :skype_id, :skype_password,  :presence => {:message => 'cannot be blank'}

  # Constant for branch #
  BRANCH = ["ADC","BDC","PDC"]

  # Scope goes here #
  scope :deleted_employees, where(:deleted => true)
  scope :current_employees, where("deleted IS NULL OR deleted = ?", false)
  scope :new_joinees, lambda { { conditions: { join_date: last_month_range } } }

  # Private method goes here #
  private
    def self.last_month_range
      1.month.ago.beginning_of_month..Time.zone.now
    end
end

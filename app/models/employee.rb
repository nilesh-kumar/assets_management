class Employee < ActiveRecord::Base
  attr_accessible :branch, :deleted, :deleted_at, :department, :designation, :email_id, :email_password, :employee_number, :helpdesk_id, :helpdesk_password, :join_date, :name, :pandian_id, :pandian_password, :pm_tool_id, :pm_tool_password, :resign_date, :sapience_id, :sapience_password, :skype_id, :skype_password, :technology, :transfered_from, :transfered_to, :wiki_id, :wiki_password
  
  # Validations goes here #
  validates :employee_number, :numericality => {:only_integer => true}
  validates :name, :email_id, :email_password, :skype_id, :skype_password,  :presence => {:message => 'cannot be blank'}
  validates :employee_number, uniqueness: true, :unless => Proc.new {|c| c.employee_number.blank?}
  validates :email_id, uniqueness: true, :unless => Proc.new {|c| c.email_id.blank?}
  validates :skype_id, uniqueness: true, :unless => Proc.new {|c| c.skype_id.blank?}
  validates :helpdesk_id, uniqueness: true, :unless => Proc.new {|c| c.helpdesk_id.blank?}
  validates :pandian_id, uniqueness: true, :unless => Proc.new {|c| c.pandian_id.blank?}
  validates :pm_tool_id, uniqueness: true, :unless => Proc.new {|c| c.pm_tool_id.blank?}
  validates :sapience_id, uniqueness: true, :unless => Proc.new {|c| c.sapience_id.blank?}
  validates :wiki_id, uniqueness: true, :unless => Proc.new {|c| c.wiki_id.blank?}
 
  # Constant for branch #
  BRANCH = ["ADC","BDC","PDC"]

  # Scope goes here #
  scope :deleted_employees, where(:deleted => true)
  scope :current_employees, where("deleted IS NULL OR deleted = ?", false)
  scope :new_joinees, lambda { { conditions: { join_date: last_month_range } } }

  # Class method goes here #
  def self.current_employees_and_new_joinees
    current_employees.new_joinees
  end

  # Attributes for search #
  searchable do
    text :name
    string :name
    boolean :deleted
    time :join_date
  end

  # Private class method goes here #
  private
    def self.last_month_range
      1.month.ago.beginning_of_month..Time.zone.now
    end
end

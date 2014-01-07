class ClientAsset < ActiveRecord::Base
  attr_accessible :client_name, :deleted, :deleted_at, :department, :employee_id, :project_manager_id, :referenceable_id, :referenceable_type
  
  #ASSOCIATIONS

  belongs_to :referenceable, polymorphic: true
  belongs_to :project_manager, :class_name => Employee
  belongs_to :employee, :class_name => Employee
  
  #VALIDATIONS

  validates :client_name, :department, presence: true
  
  # Constant for associable type #
  TYPE = ["Computer","Device", "Asset"]
  ASSETS = { "Printer" => 0, "Scanner" => 1}

  # Scope goes here #
  scope :inactive_client_assets, where(:deleted => true)
  scope :active_client_assets, where("deleted IS NULL OR deleted = ?", false)
  default_scope order('created_at DESC')

  # Class method for search #
  def self.search(search = nil,action)
    if search
      where('client_name LIKE ?', "%#{search}%")
    else
      if action == "deleted"
        inactive_client_assets
      else
        active_client_assets
      end
    end
  end

end

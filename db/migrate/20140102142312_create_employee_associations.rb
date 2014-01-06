class CreateEmployeeAssociations < ActiveRecord::Migration
  def change
    create_table :employee_associations do |t|
      t.references :associable, :polymorphic => true
      t.integer :employee_id
      t.datetime :issue_date
      t.timestamps
    end
  end
end

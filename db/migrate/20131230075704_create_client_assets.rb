class CreateClientAssets < ActiveRecord::Migration
  def change
    create_table :client_assets do |t|
      t.references :referenceable, :polymorphic => true
      t.string :client_name
      t.integer :project_manager_id
      t.integer :employee_id
      t.string :department
      t.boolean :deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

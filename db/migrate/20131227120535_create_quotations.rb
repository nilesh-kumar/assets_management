class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.integer :asset_request_id
      t.integer :vendor_id
      t.string :title
      t.text :description
      t.datetime :date
      t.float :cost
      t.boolean :accepted, :default => false

      t.timestamps
    end
  end
end

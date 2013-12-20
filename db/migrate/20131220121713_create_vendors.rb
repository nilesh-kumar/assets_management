class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.integer :contact_no
      t.integer :fax_no
      t.integer :mobile_no
      t.string :website
      t.boolean :deleted
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

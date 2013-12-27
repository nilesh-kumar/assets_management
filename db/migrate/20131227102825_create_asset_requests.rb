class CreateAssetRequests < ActiveRecord::Migration
  def change
    create_table :asset_requests do |t|
      t.integer :vendor_id
      t.string :title
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end

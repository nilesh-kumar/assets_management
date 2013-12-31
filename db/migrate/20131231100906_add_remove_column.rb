class AddRemoveColumn < ActiveRecord::Migration
  def up
    add_column :computers, :name, :string
    remove_column :computers, :computer_number
  end

  def down
    remove_column :computers, :name
    add_column :computers, :computer_number, :integer
  end
end

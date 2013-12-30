class RemoveAddColumn < ActiveRecord::Migration
  def up
    remove_column :computers, :name
    add_column :computers, :computer_number, :integer
  end

  def down
    add_column :computers, :name, :string
    remove_column :computers, :computer_number
  end
end

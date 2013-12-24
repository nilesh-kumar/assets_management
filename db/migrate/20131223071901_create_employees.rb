class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_number
      t.string :name
      t.string :designation
      t.string :technology
      t.string :department
      t.string :branch
      t.datetime :join_date
      t.datetime :resign_date
      t.string :transfered_from
      t.string :transfered_to
      t.string :email_id
      t.string :email_password
      t.string :skype_id
      t.string :skype_password
      t.string :pm_tool_id
      t.string :pm_tool_password
      t.string :pandian_id
      t.string :pandian_password
      t.string :wiki_id
      t.string :wiki_password
      t.string :sapience_id
      t.string :sapience_password
      t.string :helpdesk_id
      t.string :helpdesk_password
      t.boolean :deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

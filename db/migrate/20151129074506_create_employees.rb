class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :emp_id
      t.string :location
      t.string :email

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :income
      t.integer :expenses
      t.text :project_desc
      t.integer :employee_id

      t.timestamps
    end
  end
end

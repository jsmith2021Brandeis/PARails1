class CreateInstructors < ActiveRecord::Migration[6.1]
  def change
    create_table :instructors do |t|
      t.integer :instructor_id
      t.string :email
      t.string :first
      t.string :last

      t.timestamps
    end
  end
end

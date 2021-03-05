class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :requirements

      t.timestamps
    end
  end
end

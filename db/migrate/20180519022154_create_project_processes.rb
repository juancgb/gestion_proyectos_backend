class CreateProjectProcesses < ActiveRecord::Migration[5.1]
  def change
    create_table :project_processes do |t|
      t.integer :student_id
      t.integer :director_id
      t.references :office, foreign_key: true
      t.string :name
      t.references :career, foreign_key: true

      t.timestamps
    end
  end
end

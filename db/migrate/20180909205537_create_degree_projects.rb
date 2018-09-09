class CreateDegreeProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :degree_projects do |t|
      t.string :title
      t.string :description
      t.date :start_date
      t.date :finish_date
      t.date :date_exposition
      t.integer :score
      t.references :modalities, foreign_key: true
      t.references :project_states, foreign_key: true

      t.timestamps
    end
  end
end

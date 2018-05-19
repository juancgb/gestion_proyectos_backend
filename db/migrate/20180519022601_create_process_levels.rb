class CreateProcessLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :process_levels do |t|
      t.references :project_process, foreign_key: true
      t.references :process_level_status, foreign_key: true
      t.boolean :mandatory
      t.boolean :request
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

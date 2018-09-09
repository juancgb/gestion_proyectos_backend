class CreateProjectStates < ActiveRecord::Migration[5.1]
  def change
    create_table :project_states do |t|
      t.string :name

      t.timestamps
    end
  end
end

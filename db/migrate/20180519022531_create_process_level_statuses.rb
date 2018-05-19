class CreateProcessLevelStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :process_level_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

class AddLevelsNumberToProjectProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :project_processes, :levels_number, :integer
  end
end

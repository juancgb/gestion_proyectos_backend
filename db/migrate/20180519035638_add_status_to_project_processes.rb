class AddStatusToProjectProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :project_processes, :status, :boolean
  end
end

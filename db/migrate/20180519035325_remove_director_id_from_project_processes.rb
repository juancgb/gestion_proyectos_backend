class RemoveDirectorIdFromProjectProcesses < ActiveRecord::Migration[5.1]
  def change
    remove_column :project_processes, :director_id, :integer
  end
end

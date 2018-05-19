class RemoveStudentIdFromProjectProcesses < ActiveRecord::Migration[5.1]
  def change
    remove_column :project_processes, :student_id, :integer
  end
end

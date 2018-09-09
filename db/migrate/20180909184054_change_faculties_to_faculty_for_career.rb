class ChangeFacultiesToFacultyForCareer < ActiveRecord::Migration[5.1]
  def change
    rename_column :careers, :faculties_id, :faculty_id
  end
end

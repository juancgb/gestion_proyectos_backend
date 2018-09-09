class AddFacultyToCareer < ActiveRecord::Migration[5.1]
  def change
    add_reference :careers, :faculties, foreign_key: true
  end
end

class CreateOfficeCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :office_careers do |t|
      t.references :office, foreign_key: true
      t.references :career, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end

class CreateModalities < ActiveRecord::Migration[5.1]
  def change
    create_table :modalities do |t|
      t.string :name
      t.string :resolution
      t.boolean :is_active
      t.references :office_careers, foreign_key: true

      t.timestamps
    end
  end
end

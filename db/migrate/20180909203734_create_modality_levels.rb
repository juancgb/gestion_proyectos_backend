class CreateModalityLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :modality_levels do |t|
      t.string :name
      t.boolean :is_mandatory
      t.boolean :request
      t.references :modalities, foreign_key: true

      t.timestamps
    end
  end
end

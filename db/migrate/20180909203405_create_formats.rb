class CreateFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :formats do |t|
      t.string :name
      t.string :route
      t.references :modalities, foreign_key: true

      t.timestamps
    end
  end
end

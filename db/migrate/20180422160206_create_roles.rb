class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end

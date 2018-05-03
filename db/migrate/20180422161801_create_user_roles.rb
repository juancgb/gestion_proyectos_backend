class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.references :user, foreign_key: true
      t.references :office, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end

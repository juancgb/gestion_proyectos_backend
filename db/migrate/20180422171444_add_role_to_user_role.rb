class AddRoleToUserRole < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_roles, :role, foreign_key: true
  end
end

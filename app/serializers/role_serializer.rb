class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status
end

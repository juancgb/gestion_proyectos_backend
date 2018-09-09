class FacultySerializer < ActiveModel::Serializer
  attributes :id, :name, :is_active, :careers
  has_many :careers
end

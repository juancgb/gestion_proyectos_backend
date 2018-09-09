class FacultySerializer < ActiveModel::Serializer
  attributes :id, :name, :is_active
  has_many :careers
end

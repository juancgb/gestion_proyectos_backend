class CareerSerializer < ActiveModel::Serializer
  attributes :id, :faculty_id, :name, :status, :faculty
  belongs_to :faculty
end

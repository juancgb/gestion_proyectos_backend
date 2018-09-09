class OfficeSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :faculty
  belongs_to :faculties
end

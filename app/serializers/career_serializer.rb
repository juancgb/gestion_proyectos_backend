class CareerSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :faculties
  belongs_to :faculties
end

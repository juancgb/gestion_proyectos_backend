class CareerSerializer < ActiveModel::Serializer
  attributes :id, :faculties_id, :name, :status, :faculties
  belongs_to :faculties
end

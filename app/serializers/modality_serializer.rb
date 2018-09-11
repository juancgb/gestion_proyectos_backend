class ModalitySerializer < ActiveModel::Serializer
    attributes :id, :name, :resolution, :is_active, :office_careers, :degree_project
    belongs_to :office_careers
    belongs_to :degree_project
  end
  
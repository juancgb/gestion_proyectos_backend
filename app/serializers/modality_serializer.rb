class ModalitySerializer < ActiveModel::Serializer
  attributes :id, :name, :office_careers_id, :resolution, :is_active, :office_career, :degree_projects
  belongs_to :office_career
  has_many :degree_projects
end

class ProjectProcessSerializer < ActiveModel::Serializer
  attributes :id, :office_id, :name, :career_id, :levels_number, :status, :office, :career
  belongs_to :office
  belongs_to :career
end

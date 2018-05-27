class ProjectProcessSerializer < ActiveModel::Serializer
    attributes :id, :office_id, :name, :career_id, :levels_number, :status
    belongs_to :office
    belongs_to :career
  end
  
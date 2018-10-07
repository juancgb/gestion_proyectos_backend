class OfficeCareerSerializer < ActiveModel::Serializer
  attributes :office_id, :career_id, :office, :career, :id
  belongs_to :office
  belongs_to :career
end

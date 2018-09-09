class OfficeCareerSerializer < ActiveModel::Serializer
  attributes :office_id, :career_id, :office, :career
  belongs_to :office
  belongs_to :career
end

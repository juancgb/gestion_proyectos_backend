class ActivitySerializer < ActiveModel::Serializer
    attributes :office_id, :career_id
    belongs_to :office
    belongs_to :career
  end
  
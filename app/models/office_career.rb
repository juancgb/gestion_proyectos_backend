class OfficeCareer < ApplicationRecord
  belongs_to :office
  belongs_to :career
  has_many :modalities
  def self.find_career_by_office(office_id)
    OfficeCareer.where(office_id: office_id).includes(:office, :career)
  end
  def self.find_office_by_career(career_id)
    OfficeCareer.where(office_id: career_id).includes(:office, :career)
  end
end

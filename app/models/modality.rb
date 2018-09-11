class Modality < ApplicationRecord
  belongs_to :office_career, foreign_key: :office_careers_id
  has_many :degree_projects
end

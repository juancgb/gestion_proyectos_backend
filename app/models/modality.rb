class Modality < ApplicationRecord
  belongs_to :office_careers, foreign_key: :office_careers_id
  has_many :degree_project
end

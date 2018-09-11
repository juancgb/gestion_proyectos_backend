class DegreeProject < ApplicationRecord
  belongs_to :modalities, foreign_key: "modalities_id"
  has_one :project_states
end

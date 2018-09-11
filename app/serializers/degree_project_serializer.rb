class DegreeProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :finish_date, :date_exposition, :score, :modalities, :project_states

  belongs_to :modalities
  belongs_to :project_states
end

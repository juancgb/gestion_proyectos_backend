class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :process_level_id, :project_process_id, :name, :description, :start_date, :end_date
    belongs_to :process_level
    belongs_to :project_process
  end
  
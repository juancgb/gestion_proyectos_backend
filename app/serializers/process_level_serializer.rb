class ProcessLevelSerializer < ActiveModel::Serializer
  attributes :id, :project_process_id, :process_level_status_id, :mandatory, :request, :name, :description, :project_process, :process_level_status
  belongs_to :project_process
  belongs_to :process_level_status
end

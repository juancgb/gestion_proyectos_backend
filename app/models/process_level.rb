class ProcessLevel < ApplicationRecord
  belongs_to :project_process
  belongs_to :process_level_status
end

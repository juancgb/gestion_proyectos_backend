class Activity < ApplicationRecord
  belongs_to :process_level
  belongs_to :project_process
end

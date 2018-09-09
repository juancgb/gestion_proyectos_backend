class Career < ApplicationRecord
  belongs_to :faculty, required: true, foreign_key: :faculty_id
end

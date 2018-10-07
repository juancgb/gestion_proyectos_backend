class Career < ApplicationRecord
  belongs_to :faculty, required: true, foreign_key: :faculty_id
  has_and_belongs_to_many :offices, join_table: "office_careers"

end

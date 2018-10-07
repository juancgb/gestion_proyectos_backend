class Office < ApplicationRecord
    has_and_belongs_to_many :careers, join_table: "office_careers"
end

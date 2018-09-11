class ChangeModalitiesToModalityForDegreeProject < ActiveRecord::Migration[5.1]
  def change
    rename_column :degree_projects, :modalities_id, :modality_id
  end
end

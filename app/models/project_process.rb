class ProjectProcess < ApplicationRecord
  belongs_to :office
  belongs_to :career
  #metodo que busca por id de oficina
  def self.find_by_office(office_id)
    ProjectProcess.includes(:career).includes(:office).where(office_id: office_id)
  end
  #metodo que busca por id de carrera
  def self.find_by_career(career_id)
    ProjectProcess.includes(:career).includes(:office).where(career_id: career_id)
  end
  #metodo que busca por id de oficina e id de carrera
  def self.find_by_office_career(office_id, career_id)
    ProjectProcess.includes(:career).includes(:office).where(career_id: career_id, office_id: office_id)
  end
end

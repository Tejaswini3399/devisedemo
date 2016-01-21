class Project < ActiveRecord::Base	
	belongs_to :employee
	has_one :client

        validates :title, :employee_id, presence: true
        validates :income, :expenses, numericality: true	
end

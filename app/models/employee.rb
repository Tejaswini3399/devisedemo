class Employee < ActiveRecord::Base
end
class Employee < ActiveRecord::Base
	has_one :project
	has_one :client, :through => "project"

 	validates :first_name, :last_name, :email, :emp_id, presence: true
	validates :email, format: { with: /\A[a-zA-Z]+\z/, message: "valid email opnly" }

        def full_name
		"#{first_name} #{last_name}"
	end 
end

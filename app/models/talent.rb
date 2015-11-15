class Talent < ActiveRecord::Base
	validates :name, :description, presence: true
end

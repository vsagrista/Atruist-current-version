class Talent < ActiveRecord::Base
	belongs_to :user
	validates :name, :description, presence: true
	validates_inclusion_of :name, in: Talent_choices['profession']
  	# validates_inclusion_of :sport, in: Talent_choices['sport']
  	# validates_inclusion_of :activity, in: Talent_choices['activity']

end

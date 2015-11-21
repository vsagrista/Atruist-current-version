class Talent < ActiveRecord::Base
	belongs_to :user
	has_many :transactions
	validates :name, :description, presence: true
	#validates_inclusion_of :name, in: Talent_choices['profession']
  	# validates_inclusion_of :sport, in: Talent_choices['sport']
  	# validates_inclusion_of :activity, in: Talent_choices['activity']

  	def add_talent_if_not_on_yaml_list(talent)
  		talent_choices = YAML::load_file("#{Rails.root}/config/talent_choices.yml") #Load
		unless talent_choices["profession"].include? talent
			talent_choices["profession"] << talent
 		end
 		File.open("#{Rails.root}/config/talent_choices.yml", 'w') do |file|
		  file.puts talent_choices.to_yaml
		end
	end

	def self.get_talents_and_cities_names
		Talent.all.collect! {|talent| talent.name}
	end

end

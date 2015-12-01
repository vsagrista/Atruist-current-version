class Transaction < ActiveRecord::Base

	belongs_to     :sender,
	               :class_name => "User",
	               :foreign_key  => "sender_id"

 	belongs_to     :recipient,
                   :class_name => "User",
                   :foreign_key  => "recipient_id" 

    def self.get_datetime_format(date)
    	date = date.split("/")
		"#{date[2]}-#{date[0]}-#{date[1]}"	
    end 

    def self.generate_token(user)
      token = SecureRandom.hex.first(6)
      user.tokens << token
      token
    end
end

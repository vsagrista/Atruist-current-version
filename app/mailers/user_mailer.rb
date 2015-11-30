class UserMailer < ActionMailer::Base
	#layout 'mailer'
	def token_email(user)
	    @user = user
	    mail(to: "#{@user.email}", subject: 'Your validation token', :from => "'Altruist Mailer' <altruistmailer@gmail.com>") 
  	end
  	
  	def welcome_email(user)
  		 @user = user
  		 mail(to: "#{@user.email}", subject: 'Welcome to Altruist!', :from => "'Altruist Mailer' <altruistmailer@gmail.com>")
    end
end

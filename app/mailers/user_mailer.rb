class UserMailer < ApplicationMailer
	layout 'mailer'
	def welcome_email(user)
	    @user = user
	    @url  = 'http://example.com/login'
	    mail(to: "lanoriadesoria2@yahoo.com", subject: 'Welcome to My Awesome Site')
  	end
end

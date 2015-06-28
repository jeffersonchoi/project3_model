class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	

	def welcome(user)
		@greeting = "Hi #{user.name}"
		
		mail(to: @user.email, 
			subject: 'Welcome to the Bus Tracker App'
	end

	def forgot_password
		@greeting = "Hi"

		mail to: "to@example.org"
	end
end


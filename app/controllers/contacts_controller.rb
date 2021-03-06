class ContactsController < ApplicationController
	skip_before_filter :authenticate_user!
	skip_before_filter :collect_billing_info
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
		else
			flash.now[:error] = 'Cannot send message.'
			render :new
		end
	end
end

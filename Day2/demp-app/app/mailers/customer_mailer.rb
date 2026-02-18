class CustomerMailer < ApplicationMailer
    def welcome_email
        @customer = params[:customer]
        mail(to:@customer.email,subject:"Welcome to rails mailer concept")
    end
    def review_email(customer)
        @customer = customer
        mail(to: @customer.email,subject:"give review for the product")
    end
end

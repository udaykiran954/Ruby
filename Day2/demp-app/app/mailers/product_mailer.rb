class ProductMailer < ApplicationMailer
     def welcome_email
        @product = params[:product]
        mail(to:@product.email,subject:"Welcome to rails mailer concept")
    end
end

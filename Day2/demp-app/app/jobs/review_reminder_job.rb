class ReviewReminderJob < ApplicationJob
  queue_as :default

  def perform(customer_id)
    customer  = Customer.find(customer_id);
    CustomerMailer.review_email(customer).deliver
    # Do something later
  end
end

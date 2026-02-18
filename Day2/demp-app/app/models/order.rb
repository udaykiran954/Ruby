class Order < ApplicationRecord
    after_create_commit :schedule_review_reminder
    belongs_to :product
    has_one :customer
    def schedule_review_reminder
        ReviewReminderJob.set(wait: 5.seconds).perform_later(4)
    end
end

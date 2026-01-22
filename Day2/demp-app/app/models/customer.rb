class Customer < ApplicationRecord
   validates :name, format: { with: /\A[a-zA-Z ]+\z/, message: "Only letters are allowed" }
   validates :email, presence: true, uniqueness: true  
   validate :check_profanity

BAD_WORDS = ["badword1", "badword2","sudhamani"]
  def check_profanity
    if BAD_WORDS.any? { |word| name.to_s.downcase.include?(word) }
      errors.add(:name, "has profanity problem")
    end

    if BAD_WORDS.any? { |word| email.to_s.downcase.include?(word) }
      errors.add(:email, "has profanity problem")
    end
  end

    def check_email
        if email.present?
            true
        else
            false
        end    
    end
    def name_check
        if name.match?(/^[a-zA-Z]+$/)
           puts "Valid name"
        else
            puts "Invalid name"
        end
    end
end

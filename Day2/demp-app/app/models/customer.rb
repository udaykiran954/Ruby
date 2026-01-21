class Customer < ApplicationRecord

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

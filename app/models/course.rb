class Course < ApplicationRecord
    has_many :enrollments
    has_many :users,through: :enrollments
    def self.search(keywords)
        formatted_keywords="%#{keywords}%"
        searched_courses=Course.where("name LIKE (?) or description LIKE (?)", formatted_keywords,formatted_keywords)
    end
end

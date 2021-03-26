class Course < ApplicationRecord
    has_many :enrollments
    has_many :users,through: :enrollments
    def self.search(keywords,subject_code)
        # assume either keywords or subject code is valid
        formatted_keywords="%#{keywords}%"
        formatted_subject_code="%#{subject_code}%"
        searched_courses=Course.all()
        if !keywords.blank?
            searched_courses=searched_courses.where("name LIKE (?) or description LIKE (?)", formatted_keywords,formatted_keywords)
        end
        if subject_code !="-1"
            searched_courses=searched_courses.where(subject_id:subject_code)
        end
        searched_courses
    end
end

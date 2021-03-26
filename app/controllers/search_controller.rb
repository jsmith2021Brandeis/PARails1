class SearchController < ApplicationController
    def search()
      @subjects=Subject.all()
      if !params["query"].blank? || !params["subject"].blank?
        searched_courses=Course.search(params["query"],params["subject"])
        if searched_courses.size>0
          $courses=searched_courses
          $new_courses_search=TRUE
          redirect_to "/courses"
        else  
          flash[:danger] = "Your search returned no results"
        end
      end
    end
  end
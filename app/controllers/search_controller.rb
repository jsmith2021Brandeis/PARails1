class SearchController < ApplicationController
    def search()
      if !params["query"].blank?
        searched_courses=Course.search(params["query"])
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
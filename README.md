## PA Rails 1

#### Deliverables

[Heroku Project Link](https://desolate-falls-68235.herokuapp.com/)

[Github Project Link](https://github.com/jsmith2021Brandeis/PARails1) (Private)

Note on Bootstrap:

​	I changed the title font to Wallpoet,see app/assets/stylesheets/custom.scss

![Home](images/custom.PNG)



#### Description

​	This project imports [data on Brandeis bourses, subjects, and instructors](http://registrar-prod-rhel6.unet.brandeis.edu/export/readme.html) into a ruby on rails app that displays the information and is deployed to Heroku.

#### Views

![courses](images/home.PNG)

![courses](images/courses.PNG)

![subjects](images/subjects.PNG)

![instructors](images/instructors.PNG)

#### Scaffolds used

`rails generate scaffold Course code:string name:string description:string requirements:string`
`rails generate scaffold Instructor instructor_id:integer email:string first:string last:string`
`rails generate scaffold Subject subject_id:string name:string`





#### PA Rails 2

Following this [authentication](https://hackernoon.com/building-a-simple-session-based-authentication-using-ruby-on-rails-9tah3y4j) tutorial (also includes CSS)

and add Enrollment from my [March 5 recitation assignemnt](https://github.com/jsmith2021Brandeis/Many-To-Many-March-5) (private link)

[form helpers](https://guides.rubyonrails.org/form_helpers.html)

possibly RORT chapter 8

Scaffolds Used

```
rails generate scaffold User name:string email:string password_digest:string

rails generate controller Sessions
```

adding entry in rails console  a=User.new(name:"A" ,email:"B", password_digest:"C") 

for search page used [this](https://stackoverflow.com/questions/5911794/adding-a-new-page-in-ruby-on-rails), but rails g controller search might have been better

```ruby
if params[:subject].blank?
  @courses = Course.where("name LIKE ?", "%#{params[:search_text]}%")
else
  @courses = Subject.find(params[:subject]).courses.where("name LIKE ?",
                          "%#{params[:search_text]}%")
end
```

https://guides.rubyonrails.org/form_helpers.html

https://guides.rubyonrails.org/form_helpers.html

https://melvinchng.github.io/rails/SearchFeature.html#43-adding-a-simple-search-feature

https://dev.to/mwong068/adding-a-basic-search-form-in-rails-5hnl

https://stackoverflow.com/questions/49485384/ruby-on-rails-how-to-implement-search-function

Nice things I did

  email/password validations	

  courses sorted properly

  seed Users model

 flash error message if search fails

 can't view other user's profile, dynamic log out/signup 

link to your own profile

​	instructors, enrollments, users



-Jacob Smith 

COSI 166 B Spring 2021
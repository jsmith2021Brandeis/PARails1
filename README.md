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

-Jacob Smith COSI 166 B Spring 2021
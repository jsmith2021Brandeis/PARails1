# Seeds the databases for PA rails 1 Jacob Smith
puts "Takes 15 seconds on my computer"

Course.delete_all
Instructor.delete_all
Subject.delete_all
User.delete_all
Enrollment.delete_all

# Reset the Primary Keys
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

require 'json'

# load courses from json file
file = File.read('db/data/course.json')
data_hash = JSON.parse(file)
num_courses=data_hash.size
# sort the courses so they are easy to view and their autoamtic ids are in a reasonable order
# this sort function creates custom course code so courses are sorted properly but does't save it
data_hash.sort_by! { |course| 
                      code=course["code"]
                      name,num=code.split(" ")
                      # add leading zeros to the numeric part of course code so ANTH 1A comes before ANTH 10A and before ANTH 100A 
                      num="0"*(num.tr('^0-9',- '').length*-1+3)+num
                      code=name+" "+num
                    }
data_hash.each do |course|
  # only storing first subject of course
  Course.create(code: course["code"], name: course["name"], description: course["description"], requirements: course["requirements"].join(" "),subject_id: course["subjects"].first["id"])
end

# load instructors from json file
file = File.read('db/data/instructor.json')
data_hash = JSON.parse(file)
data_hash.each do |instructor|
  Instructor.create(instructor_id: instructor["id"], email:instructor["email"], first:instructor["first"], last:instructor["last"])
end

# load subjects from json file
file = File.read('db/data/subject.json')
data_hash = JSON.parse(file)
# sort the subjects alphabetically
data_hash.sort_by! { |subject| 
  subject["name"]
}

data_hash.each do |subject|
  Subject.create(subject_id:subject["id"], name:subject["name"])
end


# manual User creation
# create admin user for easy testing
User.create(name:"John Brown", email:"brown@brandeis.edu", password:"123456", password_confirmation:"123456")
num_users=10
for i in 0..num_users do
  last_name=Faker::Name.last_name
  password=Faker::Internet.password(min_length: 6)
  User.create(name:Faker::Name.first_name+" "+last_name, email:last_name+"@"+Faker::Internet.domain_name, password:"123456", password_confirmation:"123456")
end

#manual enrollment creation
for i in 1..num_users do
  # keeping track of the previously selected course to guarantee user isn't enrolled in the same class
  random_course=([*1..num_courses]).sample
  Enrollment.create(user_id: i, course_id: random_course)
  random_course_2=([*1..num_courses]-[random_course]).sample
  Enrollment.create(user_id: i, course_id: random_course_2)
  random_course_3=([*1..num_courses]-[random_course,random_course_2]).sample
  Enrollment.create(user_id: i, course_id: random_course_3)
end

# manual course instructor and subject creation
# Course.create(code: 1, name: "Capstone Project", description: "Learn to code", requirements:"SN EL")
# Course.create(code: 2, name: "Biblical Hebrew", description: "Learn ancient grammar", requirements:"FL SS")
# Course.create(code: 3, name: "History of Judaism", description: "Learn about Babylon", requirements:"HUM")

# Instructor.create(instructor_id:1, email:"smith@brandeis.edu", first:"John", last:"Smith")
# Instructor.create(instructor_id:2, email:"america@brandeis.edu", first:"Steve", last:"Rodgers")
# Instructor.create(instructor_id:3, email:"lincoln@brandeis.edu", first:"Abraham", last:"Lincoln")


# Subject.create(subject_id:1, name:"Computer Science")
# Subject.create(subject_id:2, name:"Hebrew")
# Subject.create(subject_id:3, name:"Judaic Studies")
# Seeds the databases for PA rails 1 Jacob Smith
puts "Takes 15 seconds on my computer"

Course.delete_all
Instructor.delete_all
Subject.delete_all
User.delete_all

# Reset the Primary Keys
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

require 'json'

# load courses from json file
file = File.read('db/data/course.json')
data_hash = JSON.parse(file)

data_hash.each do |course|
  Course.create(code: course["code"], name: course["name"], description: course["description"], requirements: course["requirements"].join(" "))
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
data_hash.each do |subject|
  Subject.create(subject_id:subject["id"], name:subject["name"])
end

# create example Users
file = File.read('db/data/subject.json')
data_hash = JSON.parse(file)
data_hash.each do |subject|
  Subject.create(subject_id:subject["id"], name:subject["name"])
end

# manual User creation
for i in 0..5 do
  last_name=Faker::Name.last_name
  password=Faker::Internet.password(min_length: 6)
  User.create(name:Faker::Name.first_name+" "+last_name, email:last_name+"@"+Faker::Internet.domain_name, password:password, password_confirmation:password)
end

# Course.create(code: 1, name: "Capstone Project", description: "Learn to code", requirements:"SN EL")
# Course.create(code: 2, name: "Biblical Hebrew", description: "Learn ancient grammar", requirements:"FL SS")
# Course.create(code: 3, name: "History of Judaism", description: "Learn about Babylon", requirements:"HUM")

# Instructor.create(instructor_id:1, email:"smith@brandeis.edu", first:"John", last:"Smith")
# Instructor.create(instructor_id:2, email:"america@brandeis.edu", first:"Steve", last:"Rodgers")
# Instructor.create(instructor_id:3, email:"lincoln@brandeis.edu", first:"Abraham", last:"Lincoln")


# Subject.create(subject_id:1, name:"Computer Science")
# Subject.create(subject_id:2, name:"Hebrew")
# Subject.create(subject_id:3, name:"Judaic Studies")
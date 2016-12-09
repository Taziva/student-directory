def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Name: "
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    cohorts = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    puts "Please enter a cohort from the following: "
    cohorts.each do |x|
      puts "#{x}"
    end
    cohort_string = gets.chomp
    while !cohorts.include? cohort_string
      puts "Please enter a valid Cohort: "
      cohort_string = gets.chomp
    end
    cohort = cohort_string.to_sym
      puts "Hobby: "
      hobby = gets.chomp
      puts "Nationality: "
      nationality = gets.chomp
      puts "Height: "
      height = gets.chomp
      # add the student hash to the array
      students << {name: name, cohort: cohort, hobby: hobby, nationality: nationality, height: height}
      puts "Now we have #{students.count} students"
      # get another name from the user
    puts "Name: "
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  student_report = students.map { |student| """Name: #{student[:name]},
  Cohort: #{student[:cohort]},
  Hobby: #{student[:hobby]},
  Nationality: #{student[:nationality]},
  Height: #{student[:height]}"""}
  puts "Which cohort:"
  user_cohort = gets.chomp
  puts student_report.select{|item| item.include? "Cohort: #{user_cohort}"}
end
def print_footer(students)
  if students.length < 1
    puts "Overall, we have #{students.count} great students"
  else
    puts "Overall, we have #{students.count} great student"
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

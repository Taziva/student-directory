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
    puts "Cohort: "
    cohort = gets.chomp.to_sym
    until !cohort.empty?
      puts "Please enter Cohort: "
      cohort_string = gets.chomp
      puts "You said #{cohort_string}, is this correct? Yes or No:"
      answer = gets.chomp
      if answer ==
         "Yes"
        cohort = cohort_string.to_sym
      else
        cohort = ""
      end
    end
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
  students.each do |student|
    puts """Name: #{student[:name]},
    Cohort: #{student[:cohort]},
    Hobby: #{student[:hobby]},
    Nationality: #{student[:nationality]},
    Height: #{student[:height]}""".center(97)
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

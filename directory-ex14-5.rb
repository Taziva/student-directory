@students = [] # an empty array accesible to all methods
@filename
def try_load_students
  @filename = ARGV.first # first argument from the command line
  if @filename.nil?
    @filename = "students.csv"
    load_students(@filename)
    puts "Loaded #{@students.count} from #{@filename}"
  elsif File.exists?(@filename)
    load_students(@filename)
    puts "Loaded #{@students.count} from #{@filename}"
  else
    puts "Sorry #{@filename} doesn't exist"
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def push_to_students_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to #{@filename}"
  puts "4. Load the list from #{@filename}"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      puts "You've chosen: 1. Input the students"
      input_students
    when "2"
      puts "You've chosen: 2. Show the students"
      show_students
    when "3"
      puts "You've chosen: 3. Save the list to students.csv"
      save_students
    when "4"
      puts "You've chosen: 4. Load the list from students.csv"
      load_students
    when "9"
      puts "You've chosen: 9. Exit"
      exit
    else
      puts "I don''t know what you mean try again"
    end
end

def save_students
  # open file for writing
  puts "What file would you like to save to:"
  @filename = STDIN.gets.chomp
  file = File.open(@filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = @filename)
    puts "What file would you like to load:"
  @filename = STDIN.gets.chomp
  if File.exists?(@filename)
    file = File.open(@filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    push_to_students_array(name, cohort)
    end
    file.close
  else
    puts "Sorry no such file exists"
    exit
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  verify_name(name)
end

def verify_name(name)
  while !name.empty? do
    # add the student hash to the array
    cohort = "november"
    push_to_students_array(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu

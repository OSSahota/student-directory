# an empty array accessible to all methods (global variable)
@students = []
#global variable to store default student file.
@students_default_filename = "students.csv"

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to specified file"
  puts "4. Load the list from specified file"
  puts "9. Exit" # 9 because we'll be adding more items

end

def process(selection)
    # 3. do what the user has asked
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  # get the first name
  name = STDIN.gets.chomp
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name, :november)

    puts "Now we have #{@students.count} students"
    
    # get another name from the user - correction applied
    name = STDIN.gets.chomp
  end
  action_successful
end

def show_students
  print_header
  print_student_list
  print_footer
  action_successful
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # Ask the user for the filename to save the student details to.
  puts "Please enter the filename and extension to save student details to"
  filename = STDIN.gets.chomp
  
  # open the file for writing in a code block (do..end) for auto closing at the end.
  File.open(filename, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  
  action_successful
end

def load_students(filename = "") # (step 14 ex 5)
  # Ask the user for the filename to load student details FROM.
  if filename == ""
    puts "Please enter name of file & extension to load student details from"
    filename = STDIN.gets.chomp
  end
  
  # Check if file exists before opening and reading file lines.
  if File.exists?(filename)
    # Reset @Student array to empty before loading next file.
    @students = [] 

    # Open file for reading in a code block (do..end) for auto closing at the end. 
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_student(name, cohort.to_sym)
      end
    end
    puts "Loaded #{@students.count} from #{filename}"  
    
    action_successful
  else # if it doesn't exist
    puts "Sorry, '#{filename}' doesn't exist."
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  # Adjusted to reference default_filename if no argument given on startup 
  # via cl (step 14 ex 2).
  if filename.nil?
    filename = (@students_default_filename)
  end
  # Check if file exists before loading into from file to array.
  if File.exists?(filename)
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# Add student details to @students array (step 14 ex 1).
def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

# Add student details to @students array (step 14 ex 1).
def action_successful
  puts "*** The chosen action was successful. ***" 
end

# load file on startup.
try_load_students
# Call interactive_menu method.
interactive_menu

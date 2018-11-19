# Request input from user.
def input_students
    puts "Please enter student details"
    puts "To finish, just hit return twice"
    puts "-------------"
    puts
    
    # Create an empty array.
    students = []
    
    # Get the first name from user.
    puts "Please enter name of student"
    # name = gets.chomp
    # name = gets.delete!("\n") # another method.
    name = gets.tr("\n","")     # another method.
    # name = gets.gsub("\n","") # another method.
    
    # While the name is not empty, repeat this code.
    while !name.empty? do
      puts "Please enter country of birth"
      country_of_birth = gets.chomp.downcase

      puts "Please enter cohort"
      cohort = gets.chomp.downcase
      # Setting cohort variable default value in case it's empty. 
      cohort = "november" if cohort.empty?
      
      puts "Please enter height"
      height = gets.chomp 

      # Add the student hash (key-value pair) to the array.
      students << {name: name, cohort: cohort, 
        country_of_birth: country_of_birth,
        height: height}
      
      puts "Now we have #{students.count} students"
      
      # Get another name from user.
      puts "Please enter the name of student"
      name = gets.chomp
    end
    # Return the array, so it can be referenced outside of this method.
    students
end

# Print the header.
def print_header
  puts "The students of Villains Academy".center(100)
  puts ("-" * (50)).center(100)
end

# Print the student names, one name on each line.
# Replaced by 'print_by_cohort' method.
def print(students)
  loop_count = 0
  while loop_count < students.count do
    # .start_with?() method checks first character & .length method returns 
    # number of charaters in hash key :name.
    if students[loop_count][:name].upcase.start_with?("M") && 
      students[loop_count][:name].length < 12
      # if condition met so output index, key and value.
      puts ("#{loop_count + 1}. #{students[loop_count][:name]}" +
      " (#{students[loop_count][:cohort]} cohort)" +
      " - #{students[loop_count][:country_of_birth]}" + 
      " - #{students[loop_count][:height]}").center(100)
    end
    loop_count += 1
  end
end

# Print by cohort.
def print_by_cohort(students)
  puts "Enter cohort to print:"
  cohort_to_print = gets.chomp.downcase

  print_header

  loop_count = 0
  students.map do |student|
    if student[:cohort] == cohort_to_print
      puts ("#{loop_count + 1}. #{students[loop_count][:name]}" +
      " (#{students[loop_count][:cohort]} cohort)" +
      " - #{students[loop_count][:country_of_birth]}" + 
      " - #{students[loop_count][:height]}").center(100)
    end
    loop_count += 1
  end
end

# Print the student count
def print_footer(students)
  puts ("-" * (50)).center(100)
  student_count = students.count
  puts ("Overall, we have #{student_count} great " + 
    "#{student_count == 1 ? "student" : "students"}").center(100)
end

students = input_students
# print_header
# print(students)
print_by_cohort(students)
print_footer(students)

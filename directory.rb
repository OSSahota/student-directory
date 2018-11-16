# Request input from user.
def input_students
    puts "Please enter student details"
    puts "To finish, just hit return twice"
    puts "-------------"
    
    # Create an empty array.
    students = []
    
    # Get the first name from user.
    puts "Please enter name of student"
    name = gets.chomp 
    
    # While the name is not empty, repeat this code.
    while !name.empty? do
      puts "Please enter country of birth"
      country_of_birth = gets.chomp 

      puts "Please enter height"
      height = gets.chomp 

      # Add the student hash (key-value pair) to the array.
      students << {name: name, cohort: :november, 
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
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print the student names, one name on each line.
def print(students)
  loop_count = 0
  while loop_count < students.count do
    # .start_with?() method checks first character & .length method returns 
    # number of charaters in hash key :name.
    if students[loop_count][:name].upcase.start_with?("M") && 
      students[loop_count][:name].length < 12
      # if condition met so output index, key and value.
      puts "#{loop_count + 1}. #{students[loop_count][:name]}" +
      " (#{students[loop_count][:cohort]} cohort)" +
      " - #{students[loop_count][:country_of_birth]}" + 
      " - #{students[loop_count][:height]}"
    end
    loop_count += 1
  end
end

# Print the student count
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

# Request input from user.
def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    
    # Create an empty array.
    students = []
    
    # Get the first name from user.
    name = gets.chomp 
    
    # While the name is not empty, repeat this code.
    while !name.empty? do
      # Add the student hash (key-value pair) to the array.
      students << {name: name, cohort: :november}
      # students.push({name: name, cohort: :november})
      # puts students
      puts "Now we have #{students.count} students"
      
      # Get another name from user.
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
  # Two 'each' methods to return the index.    
  students.each_with_index do |student, index|
    # puts student[:name].upcase
    if student[:name].upcase.start_with?("M") && student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  # students.each.with_index(1) do |student, index|
  # puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
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

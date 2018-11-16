# Put all students into an array.
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]

# Print the header.
def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

# Print the student names, one name on each line.
def print_names(students)
  students.each do |student|
    puts student
  end
end

# Print the student count
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print_names(students)
print_footer(students)

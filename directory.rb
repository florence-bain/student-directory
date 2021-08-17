# We are asking the user for an input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
#create an empty array to hold the input
  students = []
#get the first name
  name = gets.chomp
#while the input is not empty keep asking for a name
  while !name.empty? do
#add the student hash to the array
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
#asking for another name
  name = gets.chomp
  end 
#returning the array of students
students 
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end   
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#calling the methods 
print_header 
print(students)
print_footer(students)
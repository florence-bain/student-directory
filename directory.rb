# Empty array to be accessed by all methods
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the input is not empty keep asking for a name
  while !name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  # asking for another name
  name = gets.chomp
  end 
end 

def save_students
  #open the file 
  file = File.open("students.csv", "w")
  #iterate over an array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  
 file.close
end

def interactive_menu
  loop do 
    # Print the menu and ask the user what to do
    print_menu
    process(gets.chomp)
  end 
end 
  
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end 

def show_students
  print_header 
  print_students_list
  print_footer
end 
    #3 do what the user has asked 
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit 
  else 
    puts "I don't know what you meant, please try again"
  end 
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each.with_index(1) do |student, index|
    puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
  end   
end 

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu

# def save_students
#   #open the file 
#   file = File.open("students.csv", "w")
#   #iterate over an array of students
#   @students.each do |student|
#     student_data = [student[:name], student[:cohort]]
#     csv_line = student_data.join(",")
#     file.puts csv_line
#   end 
# file.close
# end
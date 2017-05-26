@students = []

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

def print_menu
  puts "type 1 to input the students"
  puts "type 2 to show the students"
  puts "type 3 to search by name"
  puts "type 4 to save the list to students.csv"
  puts "type 9 to exit"
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      search_students
      puts ""
    when "4"
      save_students
      puts "the file 'students.csv' has been saved"
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def show_students
  print_header
  print_students_list
  puts ""
  print_footer
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, hit return twice"
  print "Name: "
  name = gets.chomp
  while name != "" do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    print "Name: "
    name = gets.chomp
  end
  @students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------------------------------------"
  puts ""
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name].capitalize} is in the #{student[:cohort].capitalize} cohort."
  end
end

def print_footer
  puts ""
  if @students.count == 1 then puts "Overall, we have #{@students.count} great student!"
  else puts "Overall, we have #{@students.count} great students!" end
  puts ""
end

def search_students
  print "Please enter the first letter of the student's name: "
  letter = gets.chomp.downcase
  sorted_students = []
  @students.select do |student|
    if student[:name].split("")[0].downcase == letter
      sorted_students << student
    end
  end

  if sorted_students.empty? == false
    puts ""
    sorted_students.each { |student| puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)" }
  else
    puts ""
    puts "There are no current students whose name begins with '#{letter}'"
  end
end

# name,cohort

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = student[:name], student[:cohort]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

interactive_menu

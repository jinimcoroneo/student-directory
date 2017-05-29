@students = []

def interactive_menu
  load_students
  loop do
    print_menu
    selection = STDIN.gets.chomp
    process(selection)
  end
end

def print_menu
  puts "type 1 to input the students"
  puts "type 2 to show the students"
  puts "type 3 to search by name"
  puts "type 4 to save the file"
  puts "type 5 to load students from a file"
  puts "type 9 to exit"
  puts ""
end

def process(selection)
  case selection
    when "1"
      puts ""
      input_students
      puts ""
      puts "student(s) have been enrolled\n\n"
    when "2"
      puts ""
      show_students
    when "3"
      puts ""
      search_students
      puts ""
    when "4"
      puts ""
      save_students
      puts "the file has been saved\n\n"
    when "5"
      puts ""
      load_students
    when "9"
      puts ""
      puts "Goodbye!\n\n"
      exit
    else
      puts ""
      puts "I don't know what you meant, try again\n\n"
    end
end

def show_students
  print_header
  print_student_list
  puts ""
  print_footer
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, hit return twice"
  print "Name: "
  name = STDIN.gets.chomp
  while name != "" do
    print "Cohort: "
    cohort = STDIN.gets.chomp
    add_to_students(name, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    print "Name: "
    name = STDIN.gets.chomp
  end
end

def add_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of my cohort at Makers Academy".center(100)
  puts "-------------------------------------------".center(100)
  puts ""
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(100)
  end
end

def print_footer
  puts ""
  if @students.count == 1 then puts "Overall, we have #{@students.count} great student!".center(100)
  else puts "Overall, we have #{@students.count} great students!".center(100) end
  puts ""
end

def search_students
  print "Please enter the first letter of the student's name: "
  letter = STDIN.gets.chomp.downcase
  sorted_students = []
  @students.select do |student|
    if student[:name].split("")[0].downcase == letter
      sorted_students << student
    end
  end

  if sorted_students.empty? == false
    puts ""
    sorted_students.each do |student| 
     puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(100)
    end
  else
    puts ""
    puts "There are currently no students enrolled whose name begins with '#{letter}'".center(100)
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}".center(100)
  else
    puts "Sorry, #{filename} doesn't exist".center(100)
    exit
  end
end

def load_students
  puts "Enter file to load in, hit return to use the default 'students.csv' file"
  print "> "
  @filename = STDIN.gets.chomp

  if File.exists?(@filename)
    saving_to_file(@filename)
  elsif @filename == ""
    @filename = "students.csv"
    saving_to_file(@filename)
  else
    puts "Sorry, #{@filename} doesn't exist, cannot load file\n\n".center(100)
  end
end

def saving_to_file(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_to_students(name,cohort)
    end
  end
  puts "The file '#{@filename} has been loaded\n\n"
end

def save_students
  puts "Enter filename, hit return to use the default 'students.csv' file"
  print "> "
  @filename = STDIN.gets.chomp
  if @filename == ""
    @filename = "students.csv"
  end
  File.open(@filename, "w") do |file|
    @students.each do |student|
      student_data = student[:name], student[:cohort]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

try_load_students
interactive_menu



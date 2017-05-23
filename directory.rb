def input_students
  puts "Please enter the name and cohort of the students"
  puts "To finish, hit return twice"
  students = []
  name = gets.chomp
  cohort = gets.chomp
  while name != "" do
    students << {name: name, cohort: cohort.to_sym}
    if students.count == 1 then puts "Now we have #{students.count} student"
    else puts "Now we have #{students.count} students" end
    name = gets.chomp
    cohort = gets.chomp
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------------------------------------"
  puts ""
end

def print_students(students)
  students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)" }
end

def print_footer(names)
  puts ""
  if names.count == 1 then puts "Overall, we have #{names.count} great student!"
  else puts "Overall, we have #{names.count} great students!" end
  puts ""
end

def search_students(students)
  print "Would you like to search the current list of students? "
  answer = gets.chomp.downcase
  if answer == "yes"
    print "Please enter the first letter of the student's name: "
    letter = gets.chomp
    sorted_students = []
    students.select do |student|
      if student[:name].split("")[0] == letter
        sorted_students << student
      end
    end
    if sorted_students.empty? == false
      sorted_students.each { |student| puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)" }
    else
      puts "There are no current students whose name begins with '#{letter}'"
    end
  end
end

students = input_students
print_header
print_students(students)
print_footer(students)
search_students(students)

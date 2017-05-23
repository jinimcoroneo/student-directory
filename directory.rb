def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  students = []
  name = gets.chomp
  while name != "" do
    students << {name: name, cohort: :november}
    if students.count == 1 then puts "Now we have #{students.count} student"
    else puts "Now we have #{students.count} students" end
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------------------------------------"
  puts ""
end

def print_students(students)
  students.each { |student| puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)" }
end

def print_footer(names)
  puts ""
  puts "Overall, we have #{names.count} great students!"
end

students = input_students
print_header
print_students(students)
print_footer(students)

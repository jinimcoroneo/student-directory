def input_students
  puts "Please enter the name of the student"
  puts "To finish, hit return twice"
  students = []
  print "Name: "
  name = gets.chomp
  while name != "" do
    print "Cohort: "
    cohort = gets.chomp
    print "Hobbies: "
    hobbies = gets.chomp
    print "Birthplace: "
    birth_place = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbies, birth_place: birth_place}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    print "Name: "
    name = gets.chomp
  end
  students
end

def print_header(students)
  if students.empty? == false
    puts "The students of my cohort at Makers Academy".center(100)
    puts "-------------------------------------------".center(100)
    puts ""
  else
    puts "There are no students currently enrolled at Makers Academy".center(100)
    exit 
  end
end

def print_students(students)
  students.each_with_index do |student, index| 
    puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(100)
    puts "#{student[:name].capitalize} enjoys #{student[:hobbies]} and lives in #{student[:birth_place].capitalize}".center(100)
  end
end

def print_footer(names)
  puts ""
  if names.count == 1 then puts "Overall, we have #{names.count} great student!".center(100)
  else puts "Overall, we have #{names.count} great students!".center(100) end
  puts ""
end

def search_students(students)
  print "Would you like to search the current list of students? (y or n) "
  answer = gets.chomp.downcase
  if answer == "y"
    print "Please enter the first letter of the student's name: "
    letter = gets.chomp.downcase
    sorted_students = []
    students.select do |student|
      if student[:name].split("")[0] == letter
        sorted_students << student
      end
    end
    if sorted_students.empty? == false
      sorted_students.each { |student| puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(100) }
      puts ""
    else
      puts "There are no current students whose name begins with '#{letter}'".center(100)
      puts ""
    end
  end
end

def short_names(students)
  print "Would you like to display the students with short names? (y or n) "
  answer = gets.chomp
  if answer == "y"
    short_names = []
    students.select do |student|
      if student[:name].split("").length <= 12
        short_names << student
      end
    end
    if short_names.empty? == false
      puts ""
      puts "short names:".center(100)
      short_names.each do |student|
        puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(100)
      end
    else
      puts "There are no people with short names currently enrolled!".center(100)
    end
  end
end




students = input_students
print_header(students)
print_students(students)
puts ""
print_footer(students)
search_students(students)
puts ""
short_names(students)

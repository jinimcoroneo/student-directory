@students = []
@months = [:January, :February, :March, :April, :May, :June, :July, :August,
            :September, :October, :November, :December]

def input_students
  puts "Please enter the details of each student"
  puts "To finish, hit return twice"
  print "Name: "
  name = gets.chomp
  while name != "" do
    print "Cohort: "
    cohort = gets.chomp.capitalize
    if cohort == ""
      cohort = :November
    end

    if cohort != ""
      until @months.any? { |month| cohort.to_sym == month }
        puts "Please enter a valid month!"
        cohort = gets.chomp.capitalize.to_sym
      end
    end

    print "Hobbies: "
    hobbies = gets.chomp
    print "Birthplace: "
    birth_place = gets.chomp
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, birth_place: birth_place}
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
  if @students.empty? == false
    puts "The students of my cohort at Makers Academy".center(100)
    puts "-------------------------------------------".center(100)
    puts ""
  else
    puts "There are no students currently enrolled at Makers Academy".center(100)
    exit 
  end
end

def print_students
  @students.each_with_index do |student, index| 
    puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(100)
    puts "#{student[:name].capitalize} enjoys #{student[:hobbies]} and lives in #{student[:birth_place].capitalize}".center(100)
  end
end

def print_footer
  puts ""
  if @students.count == 1 then puts "Overall, we have #{@students.count} great student!".center(100)
  else puts "Overall, we have #{@students.count} great students!".center(100) end
  puts ""
end

def search_students
  print "Would you like to search the current list of students? (y or n) "
  answer = gets.chomp.downcase
  if answer == "y"
    print "Please enter the first letter of the student's name: "
    letter = gets.chomp.downcase
    sorted_students = []
    @students.select do |student|
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

def search_by_cohort

end

def short_names
  print "Would you like to display the students with short names? (y or n) "
  answer = gets.chomp
  if answer == "y"
    short_names = []
    @students.select do |student|
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
print_header
print_students
puts ""
print_footer
search_students
puts ""
short_names

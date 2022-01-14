class Bootcamp
  attr_reader :name, :slogan, :teachers, :students
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @grades = Hash.new {|h,k| h[k]=[]}
  end

  def hire(teacher_name)
    @teachers << teacher_name
  end

  def enroll(student_name)
    if @students.length < @student_capacity
      @students << student_name
      true
    else
      false
    end
  end

  def enrolled?(student_name)
    @students.include?(student_name)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student_name, grade)
    if self.enrolled?(student_name)
      @grades[student_name] << grade
      true
    else
      false
    end
  end

  def num_grades(student_name)
    @grades[student_name].length
  end

  def average_grade(student_name)
    if self.enrolled?(student_name) && !@grades[student_name].empty?
      sum = @grades[student_name].sum
      count = @grades[student_name].count
      sum / count
    else
      nil
    end
  end
end

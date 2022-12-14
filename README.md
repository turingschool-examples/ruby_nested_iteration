## Ruby Nested Iteration Practice

Starting with the `course_spec`, then moving on to the `school_spec`, unskip tests as you come to them and make each of those tests pass.

Some rules:
* do not create any additional instance variables,
* do not change anything about the tests (except for unskipping them),
* do not create any helper methods.

As you work through this exercise, the classes will eventually respond to the interaction pattern below:

## Student

A student is assigned a group through an attr_accessor - `student.group = :group`.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> student = Student.new('Bruce')
#=>  #<Student:0x0000000146a088f8 @group=nil, @name="Bruce">

pry(main)> student.name
#=> "Bruce"

pry(main)> student.group
#=> nil

pry(main)> student.group = :bhatt

pry(main)> student.group
#=> :bhatt
```


## Course

The `student_groups` method should return an unique list of groups for the students in that course.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> require './lib/course'
#=> true

pry(main)> student1 = Student.new('Tucker')    
#=> #<Student:0x00000001469ecb80 @group=nil, @name="Tucker">

pry(main)> student1.group = :ellis    

pry(main)> student2 = Student.new('Penny')    
#=> #<Student:0x000000014697da00 @group=nil, @name="Penny">

pry(main)> student2.group = :bhatt    

pry(main)> student3 = Student.new('Bo')    
#=> #<Student:0x0000000146a6a698 @group=nil, @name="Bo">

pry(main)> student3.group = :bhatt    

pry(main)> course = Course.new('Philosophy', 'Charles Babbage')    
#=> #<Course:0x00000001469bca70 @name="Philosophy", @professor="Charles Babbage", @students=[]>

pry(main)> course.name
#=> "Philosophy"

pry(main)> course.professor
#=> "Charles Babbage"

pry(main)> course.students
#=> []

pry(main)> course.add_student(student1)    

pry(main)> course.add_student(student2)    

pry(main)> course.add_student(student3)    

pry(main)> course.students
#=> [#<Student:0x00000001469ecb80 @group=:ellis, @name="Tucker">,
     #<Student:0x000000014697da00 @group=:bhatt, @name="Penny">,
     #<Student:0x0000000146a6a698 @group=:bhatt, @name="Bo">]

pry(main)> course.groups_represented
#=> [:bhatt, :ellis]
```

## School

A school is created with a `name` and and list of study `groups`.  At this school, students are enrolled in courses, and then assigned to their study groups. The `group_students` method should assign a group to every student enrolled in a course or courses at that school.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> require './lib/course'
#=> true

pry(main)> require './lib/school'
#=> true

pry(main)> @student1 = Student.new('Tucker')
#=> #<Student:0x0000000147039718 @group=nil, @name="Tucker">

pry(main)> @student2 = Student.new('Penny')    
#=> #<Student:0x00000001468df788 @group=nil, @name="Penny">

pry(main)> @student3 = Student.new('Bo')    
#=> #<Student:0x000000015695a6a8 @group=nil, @name="Bo">

pry(main)> @student4 = Student.new('Bruce')    
#=> #<Student:0x00000001469f6090 @group=nil, @name="Bruce">

pry(main)> @student5 = Student.new('Rey')    
#=> #<Student:0x00000001469b6698 @group=nil, @name="Rey">

pry(main)> @student6 = Student.new('KJ')    
#=> #<Student:0x000000014697d208 @group=nil, @name="KJ">

pry(main)> @student7 = Student.new('Tess')    
#=> #<Student:0x0000000146a629e8 @group=nil, @name="Tess">

pry(main)> @course1 = Course.new('Philosophy', 'Charles Babbage')    
#=> #<Course:0x0000000146a2b178 @name="Philosophy", @professor="Charles Babbage", @students=[]>

pry(main)> @course1.add_student(@student1)    

pry(main)> @course1.add_student(@student2)    

pry(main)> @course1.add_student(@student3)    

pry(main)> @course2 = Course.new('Cryptology', 'Joan Clarke')    
#=> #<Course:0x00000001469975b8 @name="Cryptology", @professor="Joan Clarke", @students=[]>

pry(main)> @course2.add_student(@student3)    

pry(main)> @course2.add_student(@student4)    

pry(main)> @course2.add_student(@student5)    

pry(main)> @course3 = Course.new('Mathematics', 'Ada Lovelace')    
#=> #<Course:0x0000000147031400 @name="Mathematics", @professor="Ada Lovelace", @students=[]>

pry(main)> @course3.add_student(@student5)    

pry(main)> @course3.add_student(@student6)    

pry(main)> @course3.add_student(@student7)    

pry(main)> @school = School.new('Turing School', [:bhatt, :ellis, :hopper, :windsor])    
#=> #<School:0x000000014690e100 @courses=[], @groups=[:bhatt, :ellis, :hopper, :windsor], @name="Turing School">

pry(main)> @school.name
#=> "Turing School"

pry(main)> @school.groups
#=> [:bhatt, :ellis, :hopper, :windsor]

pry(main)> @school.courses
#=> []

pry(main)> @school.add_course(@course1)

pry(main)> @school.add_course(@course2)

pry(main)> @school.add_course(@course3)

pry(main)> @school.courses
#=> [#<Course:0x0000000146a2b178...>, #<Course:0x00000001469975b8...>,#<Course:0x0000000147031400...>]

pry(main)> @school.assign_to_group(@student1)

pry(main)> @student1.group
#=> will be one of the 4 groups

pry(main)> @school.group_all_students

pry(main)> @student1.group
#=> will be one of the 4 groups

pry(main)> @student2.group
#=> will be one of the 4 groups

pry(main)> @student3.group
#=> will be one of the 4 groups

...

# We are now resetting the students groups, for the last method.
pry(main)> @student1.group = :ellis    

pry(main)> @student2.group = :bhatt    

pry(main)> @student3.group = :bhatt    

pry(main)> @student4.group = :bhatt    

pry(main)> @student5.group = :hopper    

pry(main)> @student6.group = :hopper    

pry(main)> @student7.group = :windsor    

pry(main)> @school.students_by_group
#=> {:ellis=>[#<Student:0x0000000147039718...>],
#    :bhatt=>[#<Student:0x00000001468df788...>,
#             #<Student:0x000000015695a6a8...>,
#             #<Student:0x00000001469f6090...>],
#    :hopper=>[#<Student:0x00000001469b6698...>,
#              #<Student:0x000000014697d208...>],
#    :windsor=>[#<Student:0x0000000146a629e8...>]}
```

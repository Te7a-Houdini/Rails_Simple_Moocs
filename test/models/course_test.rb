require 'test_helper'

class CourseTest < ActiveSupport::TestCase
   test "the truth" do
     course = Course.new(:title => "a new course")
     assert_not course.save() #expected to fail
  end
end
#rake test test/models/course_test.rb
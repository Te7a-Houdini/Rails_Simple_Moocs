require 'test_helper'

class CourseTest < ActiveSupport::TestCase
   test "the truth" do
     course = Course.new()
     assert_not course.save() #expected to succsed cause presences true of title in model
  end
end
#rake test test/models/course_test.rb

#include Devise::TestHelpers remember to remove this line before running this test from test_helper
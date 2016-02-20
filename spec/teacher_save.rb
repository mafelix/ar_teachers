require_relative 'spec_helper'
require 'pry'
describe Student do
  before :each do
    @teacher = Teacher.create(name: "Felix Ma", email: "felix@felix.com", address: "1234 lighthouse dr", phone: 1231234123)
    @student = Student.create(first_name:"Qidi", last_name: "qidi", gender: "female", birthday: "1990-1-1", email: "Qidi@qidi.com", phone: "1234567811")
  end

 it'should save to teachers last_added_at when student is created' do
    @student.teacher = @teacher
    @student.save
    @teacher.save
    expect(@teacher.last_student_added_at = @student)
  end
end
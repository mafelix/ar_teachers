class Teacher < ActiveRecord::Base
  has_many :students
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true  
  validate :retirement_check_hire_date

  after_save :retired_yet?

  def retired_yet?
    if retirement_date == Date.today || retirement_date > Date.today
      students.teacher_id = nil
    end
  end



  def retirement_check_hire_date
    if hire_date && retirement_date && retirement_date < Date.today
      hire_date < retirement_date
    else
      errors.add(:retirement_date, "Retirement date has to be after the hire date")
    end
  end


end
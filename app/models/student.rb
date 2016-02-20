class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher
  validates :email, uniqueness: true
  validate :no_toddlers
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i #valid email regex


  def no_toddlers
    if age <= 3
      errors.add(:birthday, "No toddlers allowed.")
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year - birthday.year - ((Time.now.month > birthday.month || (Time.now.month == birthday.month && Time.now.day >= birthday.day)) ? 0 : 1)
  end


end

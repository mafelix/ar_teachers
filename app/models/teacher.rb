class Teacher < ActiveRecord::Base
  has_many :students
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true  
end
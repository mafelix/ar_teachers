class ForeignkeyForTeacher < ActiveRecord::Migration
#syntax for naming matters, you do not need to name the foreign key.
  def change
    add_reference :students, :teacher, index:true
  end
end

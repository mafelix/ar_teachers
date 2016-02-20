class CreateTeachers < ActiveRecord::Migration

  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :phone
      t.timestamps null: false
    end


  end
end


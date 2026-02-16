class AddUniqueIndexToForeignkeyInFinalExam < ActiveRecord::Migration[8.1]
  def change
    remove_index :final_exams,:course_id
    add_index :final_exams,:course_id,unique:true
  end
end
class CreateFinalExams < ActiveRecord::Migration[8.1]
  def change
    create_table :final_exams do |t|
      t.integer :total_marks
      t.datetime :exam_date

      t.timestamps
    end
  end
end

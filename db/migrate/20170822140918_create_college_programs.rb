class CreateCollegePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :college_programs do |t|
    	t.integer :college_id
    	t.integer :program_id

      t.timestamps
    end
  end
end

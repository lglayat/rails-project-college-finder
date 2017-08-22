class CreateColleges < ActiveRecord::Migration[5.1]
  def change
    create_table :colleges do |t|
    	t.string :name
    	t.string :state
    	t.integer :sat_score
    	t.integer :act_avg
    	t.integer :cost
      t.timestamps
    end
  end
end

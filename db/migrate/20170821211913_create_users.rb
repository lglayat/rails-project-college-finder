class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :password_digest
    	t.integer :program_id
    	t.integer :sat_score
    	t.integer :act_avg
      t.timestamps
    end
  end
end

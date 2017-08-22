require 'csv'
require 'pry'
# require_all 'app/models'

# CSV.foreach('db/data.csv') do |row|
# 	college = College.new(name: row[3], state: row[5], sat_score: row[60], act_avg: row[56], cost: row[376] )
# 	binding.pry
# end


csv_text = File.read('db/data.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	college = College.create(name: row[0], state: row[2], sat_score: row[6], act_avg: row[7], cost: row[46] )
end

#associations
# field_lengths = {}

# CSV.foreach('db/data.csv', :headers => true, :header_converters => :symbol) do |csv_row|
# 	csv_row.each do |k, v|
# 		field_lengths[k] = [field_lengths[k] || 0, v.length].max
# 	end
# 	binding.pry
# 	college = College.create(name: field_lengths{:INSTM}, state: row[2], sat_score: row[6], act_avg: row[7], cost: row[46] )
# 	field_lengths = {}
# end


programs_array = ["English Language and Literature", "Education", "Architecture", "Agriculture", 
	"Communications/Journalism", "Computer and Information Sciences", "Culinary Services", 
	"Engineering", "Legal Professions and Studies", "Liberal Arts and Sciences", "Biological and Biomedical Sciences",
	"Mathematics and Statistics", "Philosophy and Religious Studies", "Psychology", "Social Sciences",
	"Visual and Performing Arts", "Business", "History"]
programs_array.each do |program|
	program = Program.create(name: program)
end

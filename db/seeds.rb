require 'csv'
require 'pry'
# require_all 'app/models'

def make_associations(college, hash)
	counter = 0
	
	hash.each do |k,v|
		if counter > 8
			if v == "1"
				val = normalize(k.to_s)
				program = Program.find_by(name: val)
				college.programs << program if program != nil
			end
		end

		counter+= 1
	end
	nil
end

def normalize(str)
	arr = str.split("_")
	returnArr = []
	arr.each do |v|
		if v == "and"
			returnArr << v
		else
			returnArr << v.capitalize
		end
	end
	returnStr = returnArr.join(" ")
end


# Create Colleges
csv_text = File.read('db/data.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	college = College.create(name: row[0], state: row[2], homepage: row[3], acceptance_rate: row[4], sat_score: row[6], act_avg: row[7], cost: row[46] )
end


# Create Programs
programs_array = ["English Language and Literature", "Education", "Architecture", "Agriculture", 
	"Communications and Journalism", "Computer and Information Sciences", "Culinary Services", 
	"Engineering", "Legal Professions and Studies", "Liberal Arts and Sciences", "Biological and Biomedical Sciences",
	"Mathematics and Statistics", "Philosophy and Religious Studies", "Psychology", "Social Sciences",
	"Visual and Performing Arts", "Business", "History"]
programs_array.each do |program|
	program = Program.create(name: program)
end


#Associate Programs and College
hash = {}

CSV.foreach('db/data.csv', :headers => true, :header_converters => :symbol) do |csv_row|
	# create hash for every tuple in CSV file
	csv_row.each do |k, v|
		hash[k] = [hash[k] || v].max
	end

	college = College.find_by(name: hash[:instnm])
	

	make_associations(college, hash)

	college.save


	# binding.pry
	# reset hash to empty
	hash = {}
end



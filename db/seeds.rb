puts "populating db."

Story.destroy_all

filepath = "#{File.open(File.join(Rails.root, 'db')).path}/stories.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  # Here, row is an array of columns
  story = Story.create!(plot: row['story'], location: row['where'], when: row['when'], active: true)

  puts "#{story.id} was created."
end

puts "done."

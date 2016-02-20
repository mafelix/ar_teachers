class StudentsImporter

  def initialize(filename=File.absolute_path('db/data/students.csv'))
    @filename = filename
  end

  def import
    field_names = ['first_name', 'last_name', 'gender', 'birthday', 'email', 'phone']
    puts "Importing students from '#{@filename}'"
    failure_count = 0
  #transcation active record method 
  Student.transaction do
    File.open(@filename).each do |line|
      data = line.chomp.split(',')
      attribute_hash = Hash[field_names.zip(data)]
      #[Jason,Wan,male,1980-01-01,jason.wan@example.com,415-555-6654]
      #attribute_hash ={first_name: 'Jason'...}
        begin
          Student.create!(attribute_hash)
          #STudent.create!(first_name: 'Jason'....)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        ensure
          #STDOUT.flush forces to print immediately
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} student records)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end

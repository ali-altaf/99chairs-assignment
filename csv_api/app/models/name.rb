class Name < ActiveRecord::Base

  def self.process_names(csv_params)
    names = {}
    csv = CSV.parse(csv_params, :headers => true)
    csv.each do |row|
      first_name = row[1]
      names[first_name] = names.key?(first_name) ? names[first_name] += 1 : 1
    end
    return names.select{|k,v| v > 1}
  end
end

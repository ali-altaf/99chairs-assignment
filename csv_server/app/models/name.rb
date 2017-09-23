class Name < ActiveRecord::Base
  include ApiHelper
  validates_presence_of :first_name

  def self.create_names(csv_data)
    csv_params = {
        'data': csv_data
    }

    result = self.process_csv(csv_params)
    process_result_from_api(result)
  end

  def self.add_response_data(result)
    puts "Im here"
    result['first_name_counts'].each do |k, v|
      if (!Name.exists?(first_name: k))
        puts "First Name exists"
        Name.create(first_name: k, first_name_count: v.to_s)
      else
        puts "Updating older"
        Name.where(first_name: k).update_all(first_name_count: v.to_s)
      end
    end
  end

  def self.process_result_from_api(result)
    if (result['success'] == false)
      return false
    else
      add_response_data(result)
      return true
    end
  end
end

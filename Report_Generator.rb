require 'active_record'
require 'csv'

ActiveRecord::Base.establish_connection(  
:adapter => "mysql",  
:host => "localhost",
:user => "root",
:password => "aspirine",  
:database => "Report"  
)  
 

class Msisdn < ActiveRecord::Base
  self.table_name = "msisdn"
end

class Ftt < ActiveRecord::Base
  self.table_name = "ftt"
end

class ReportGenerator 

  def get_data item
    a = Ftt.all( :conditions => { :msisdn => item})
  end

 
  def msisdn
    list1 = []
    msisdn = Msisdn.find(:all, :select => "msisdn").map(&:msisdn)
    msisdn.each do|item|
      a = get_data(item)
      list1 << a            
    end
    list1
  end

 
  def write_data
    CSV.open("data.csv","w") do |csv|
      msisdn.each do |row|
        csv << row.split(",") 
      end
    end
  end

end

obj = ReportGenerator.new
obj.write_data


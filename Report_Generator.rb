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

  def get_data msisdn
    Ftt.first( :conditions => { :msisdn => msisdn})
  end

 
  def msisdns
    list = []
    msisdns = Msisdn.find(:all, :select => "msisdn").map(&:msisdn)
    msisdns.each do|msisdn|
      list <<  get_data(msisdn)            
    end
    list
    p "hi"
  end

 
  def write_data data
    CSV.open("data.csv","w") do |csv|
      data.each do |row| 
        csv << row.split(",") 
      end
    end
  end

  def retailers
  end

end

obj = ReportGenerator.new

obj.write_deata(obj.msisdns)


require 'rubygems'  
require 'active_record'
  
ActiveRecord::Base.establish_connection(  
:adapter => "mysql",  
:host => "localhost",
:user => "root",
:password => "aspirine",  
:database => "test"  
)  
 

class Base1 < ActiveRecord::Base
  self.table_name = "base"
end

def load_data row
    Base1.create ( :msisdn => "#{row[0].strip}", :ftt => "#{row[1].strip}", :combo => "#{row[2].strip}", :std => "#{row[3].strip}", :isd => "#{row[4].strip}", :gprs => "#{row[5].strip}", 
                   :vas => "#{row[6].strip}" )  
end

def get_data 
  f1 = File.open("base.csv", "r")
  arr = f1.readlines
  arr.each do |item|
    row = item.split(",")
    load_data  row
  end
end
   

get_data

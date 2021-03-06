require 'mysql'
require 'yaml'

def settings
  YAML.load(File.open('config.yaml'))
end

def mysql_connection mode = nil
  (mode.nil?) ? (Mysql.new(@settings["db_settings"]["host"], @settings["db_settings"]["user"], @settings["db_settings"]["password"], @settings["db_settings"]["db"])) : (mode.close)
end

def load_data con, row
    con.query("INSERT INTO table2(msisdn,ftt) VALUES ('#{row[0].strip}','#{row[1].strip}')")
end

def get_data con
  f1 = File.open("base.csv", "r")
  arr = f1.readlines
  arr.each do |item|
    row = item.split(",")
    load_data con, row
  end
end


def run 
  @settings = settings
  con = mysql_connection
  get_data con
  mysql_connection con
end

run

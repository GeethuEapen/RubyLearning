require 'mysql'
require 'yaml'

def settings
  YAML.load(File.open('test.yaml'))
end

def mysql_connection mode = nil
  (mode.nil?) ? (Mysql.new(@settings["db_sesstings"]["host"], @settings["db_sesstings"]["user"], @settings["db_sesstings"]["password"], @settings["db_sesstings"]["db"])) : (mode.close)
end

def load_data con, data
  data.each do |row|
    con.query("INSERT INTO trials(name,updated_at) VALUES ('#{row["name"]}','#{row["updatedat"]}')")
  end  
end

def show_data con
  result = con.query('select * from trials')
  result.each do |row|
    puts row[1]
  end
end

def run data
  @settings = settings
  con = mysql_connection
  load_data con, data
  show_data con
  mysql_connection con
end

data = [{"name" => "Foo", "updatedat" => "foo"}, {"name" => "Bar", "updatedat" => "bar"}]
run(data)



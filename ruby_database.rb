#code to perform insertion to a database

require 'mysql'

con=Mysql.new('localhost','root','aspirine','test')
result = con.query('select * from trials')

result.each do |row|
  puts row[1]
end


data = [{"name" => "Foo", "updatedat" => "foo"}, {"name" => "Bar", "updatedat" => "bar"}]

data.each do |row|
  con.query("INSERT INTO trials(name,updated_at) VALUES ('#{row["name"]}','#{row["updatedat"]}')")
end

con.close


""

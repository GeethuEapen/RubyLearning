#code to perform file operation

f1 = File.open("/home/geethu/Downloads/trials.txt", "r") 
list = []
p f1
arr = f1.readlines
arr.each do |item|
 list << item.strip
  end
p list

f2 =File.open("/home/geethu/Downloads/trials2.txt", "w")

list.each do|item|
  f2.write(item + "\n")
end

f2.close



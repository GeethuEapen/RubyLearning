
f1 = File.open("/home/geethu/Downloads/trials.txt", "r") 
list = []
p f1
arr = f1.readlines
arr.each do |item|
 list << item
  end
p list



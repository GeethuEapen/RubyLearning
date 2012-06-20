
#code to filter even numbers from a list of numbers

def EvenFilter(array)
 result = []
  array.each do|item|
       result << item if item % 2 == 0
    end
 result
end
 p EvenFilter([1,2,3,4,5,6,7])

 

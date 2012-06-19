def foo(arr)
  arr.each do|item|
    if item%2==0
       puts item
    end
  end
end

foo([1,2,3,4,5,6,7])
 

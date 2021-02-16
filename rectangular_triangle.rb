def rectangular?(sides)
  biggest = sides.index(sides.max)
  sum = 0
  sides.each_with_index do |x, index|
    sum += x**2 unless index == biggest
  end
  sides[biggest]**2 == sum
end

def isosceles?(sides)
  sides.uniq.size == 2
end


sides = []
print 'Enter the first side: '
sides.push(gets.chomp.to_f)
print 'Enter the second side: '
sides.push(gets.chomp.to_f)
print 'Enter the third side: '
sides.push(gets.chomp.to_f)
print "This triangle is #{rectangular?(sides) ? '' : 'not '}rectangular"
if(isosceles?(sides))
  print ', also it is isosceles.'
end




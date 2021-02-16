def valid?(sides)
  biggest = sides.index(sides.max)
  sum = 0
  sides.each_with_index do |x, index|
    sum += x unless index == biggest
  end
  sum > sides[biggest]
end

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
if valid?(sides)
  print "This triangle is #{rectangular?(sides) ? '' : 'not '}rectangular"
  print ', also it is isosceles.' if isosceles?(sides)
else
  print 'Triangle is not valid'
end

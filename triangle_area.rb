print 'Enter the base of the triangle(a): '
base = gets.chomp.to_f
print 'Enter the height of the triangle(h): '
height = gets.chomp.to_f
if base.positive? && height.positive?
  print "The area of this triangle is #{base * height * 0.5}"
else
  print 'Wrong input!'
end

def solve_equation(a, b, c)
  d = b**2 - 4 * a * c
  puts "D = #{d}"
  return nil if d.negative?

  results = []
  results.push((-b + Math.sqrt(d)) / 2 * a)
  results.push((-b - Math.sqrt(d)) / 2 * a)
  results.uniq
end


print 'Enter a: '
a = gets.chomp.to_f
print 'Enter b: '
b = gets.chomp.to_f
print 'Enter c: '
c = gets.chomp.to_f

print "The root(s): #{solve_equation(a, b, c)}"

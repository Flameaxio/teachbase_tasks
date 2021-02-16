p 'Enter your name: '
name = gets.chomp
p 'Enter your height: '
height = gets.chomp.to_i

ideal_weight = (height - 110).positive? ? (height - 110) : 'achieved already'
puts "#{name.capitalize}, your ideal weight is #{ideal_weight}"

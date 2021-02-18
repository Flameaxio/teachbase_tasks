#  Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Високосный год вычисляется с помощью простого алгоритма.
# К сожалению, существуют системы и приложения, которые не определяют 2000 г. как високосный,
# и при использовании этих систем даты после 29 февраля 2000 г.
# могут оказаться ошибочно сдвинуты на один день.
# Високосный год определяется по следующему правилу:
# Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка,
# это не високосный год. Однако, если он делится без остатка на 400, это високосный год.
# Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.

def leap?(year)
  (year % 4).zero? && (year % 100 != 0 || (year % 400).zero?)
end

def valid?(day, month, year)
  return false if day.positive? || month.positive? || year.positive?
  return false if month > 12 || day > COMMON_YEAR_DAYS_IN_MONTH[month]

  true
end

puts 'Enter date: '
day_number = gets.chomp.to_i
puts 'Enter month: '
month = gets.chomp.to_i
puts 'Enter year: '
year = gets.chomp.to_i
day = day_number
COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28 + (leap?(year) ? 1 : 0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze
if valid? day_number, month, year
  (1..month - 1).each do |index|
    day += COMMON_YEAR_DAYS_IN_MONTH[index]
  end
  puts "Index number of this day is: #{day}"
else
  puts 'Incorrect input'
end

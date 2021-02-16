# Заполнить массив числами фибоначи до 100

def fibonacci(n)
  return n if (0..1).include? n

  (fibonacci(n - 1) + fibonacci(n - 2))
end

fibonacci_array = []
loop do
  number = fibonacci(fibonacci_array.size + 1)
  break if number > 100

  fibonacci_array.push(number)
end
puts fibonacci_array

#Сумма покупок. Пользователь вводит поочередно название товара,
# цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

receipt = {}
loop do
  puts 'Enter the name (or stop to exit): '
  name = gets.chomp
  break if name == 'stop'

  puts 'Enter price per unit: '
  price = gets.chomp.to_f
  puts 'Enter quantity: '
  quantity = gets.chomp.to_f

  receipt[name] = { price: price, quantity: quantity, total: price * quantity }
end
receipt_total = 0
receipt.each do |name, info|
  printf("%3s - $%6f - %9f units - Total%12f \n", name, info[:price], info[:quantity], info[:total])
  receipt_total += info[:total]
end
printf("%15s Total: $#{receipt_total}", '')

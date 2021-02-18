# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)

VOWELS = 'aeiou'.freeze

vowels_hash = {}

('a'..'z').each_with_index do |l, index|
  vowels_hash[l] = index + 1 if VOWELS.include?(l)
end
puts vowels_hash

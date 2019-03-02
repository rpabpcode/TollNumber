

require_relative 'validations'
require 'benchmark'

class TollFreeNumber
  FILE_PATH = 'dictionary.txt'

  # mapping numbers to LETTERS
  LETTERS = { '2' => %w[a b c],
              '3' => %w[d e f],
              '4' => %w[g h i],
              '5' => %w[j k l],
              '6' => %w[m n o],
              '7' => %w[p q r s],
              '8' => %w[t u v],
              '9' => %w[w x y z] }.freeze

  def toll_convert(numbers)
    # Make sure that number is between 2-9 and not characters.
    validate_string = Validations.new.validate(numbers)
    return unless validate_string == 'Valid'

    dictionary = {}
    (1..20).each { |i| dictionary[i] = [] }
    # Read dictionary file and assign values to array
    file = File.read(FILE_PATH).downcase!

    file.each_line do |line|
      dictionary[line.length] << line.chop
    end
    # map each number array
    keys = numbers.chars.map { |number| LETTERS[number] }
    results = {}
    total_number = keys.length - 1 # total numbers

    # Loop through all LETTERS and get matching records with dictionary
    (2..total_number - 2).each do |i|
      first_array = keys[0..i]
      # puts first_array
      next if first_array.length < 3

      second_array = keys[i + 1..total_number]
      next if second_array.length < 3

      # Get product of arrays #get_combination(first_array, dictionary)#
      first_set = first_array.shift.product(*first_array).map(&:join)
      next if first_set.nil?

      second_set = second_array.shift.product(*second_array).map(&:join)
      next if second_set.nil?

      # get common values from arrays
      results[i] = [(first_set & dictionary[i + 2]), (second_set & dictionary[total_number - i + 1])]
    end
    # arrange words to frame output

    final_words = []
    results.each do |_key, sequence|
      next if sequence.values_at(0, -1).nil?

      sequence.first.product(sequence.last).each do |conjoin_words|
        final_words << conjoin_words
      end
    end

    # matche with all character
    final_words << (keys.shift.product(*keys).map(&:join) & dictionary[11]).join(', ')
    p final_words
  end
end

# request user for console input
puts 'Please Enter 10 digit Number - Except 0 & 1 digits :'
numbers = gets.chomp.to_s.strip # Assign input to numbers
time = Benchmark.realtime do
  TollFreeNumber.new.toll_convert(numbers)
end
p time.round(2)

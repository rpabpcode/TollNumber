
class TollFreeNumber
  FILE_PATH = 'dictionary.txt'.freeze

# mapping numbers to LETTERS
  LETTERS = {'2' => %w[a b c],
             '3' => %w[d e f],
             '4' => %w[g h i],
             '5' => %w[j k l],
             '6' => %w[m n o],
             '7' => %w[p q r s],
             '8' => %w[t u v],
             '9' => %w[w x y z]}

  def toll_convert(numbers)
    # Make sure that number is between 2-9 and not characters.
    validate_string = validate(numbers)
    return unless validate_string == 'Valid'

    dictionary = {}
    (1..20).each { |i| dictionary[i] = [] }
    # Read dictionary file and assign values to array
    File.foreach(FILE_PATH) do |word|
      dictionary[word.length] << word.chop.to_s.downcase
    end

    keys = numbers.chars.map { |number| LETTERS[number] } # map each number array
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
      first_combination = first_array.shift.product(*first_array).map(&:join)
      next if first_combination.nil?
      second_combination = second_array.shift.product(*second_array).map(&:join)
      next if second_combination.nil?
      # get common values from arrays
      results[i] = [(first_combination & dictionary[i + 2]), (second_combination & dictionary[total_number - i + 1])]
    end
    # arrange words like we need as a output

    final_words = []
    results.each do |_key, combinataions|
      next if combinataions.values_at(0, -1).nil?
      combinataions.first.product(combinataions.last).each do |combo_words|
        final_words << combo_words
      end
    end
    # matche with all character
    final_words << (keys.shift.product(*keys).map(&:join) & dictionary[11]).join(', ')
    p final_words
  end

  def check_string(string)
    string.scan(/\D/).empty? # Make sure that string contains only numbers
  end

  def validate(numbers)
    if !check_string(numbers) # Allow only numbers
      p 'Plese enter only Numbers!'
      return
    elsif numbers.nil? || numbers.length != 10 || numbers.count('01') > 0
      # verify the number is valid and does not contains eihter "0" or "1"
      p 'Not a valid Number and Exiting!'
      return
    elsif !File.exist?(FILE_PATH)
      # Verify the dictionary file exists or not
      p 'Dictionary file does not exist and Exiting'
      return
    end
    'Valid'
  end

end
# request user for console input
puts 'Please Enter 10 digit Number - Except 0 & 1 digits :'
numbers = gets.chomp.to_s.strip # Assign input to numbers
start_time = Time.now
TollFreeNumber.new().toll_convert(numbers)
end_time = Time.now
p (end_time - start_time) * 1000.0

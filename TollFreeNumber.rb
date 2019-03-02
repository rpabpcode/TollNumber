require 'byebug'

FILE_PATH = "dictionary.txt"

def letter_combinations()
  puts "Please Enter 10 digit Number - Except 0 & 1 digits : "
  numbers = check_string(gets.chomp)
  unless numbers # Allow only numbers
    p "Plese enter only Numbers!"
    return
  end

  # verify the number is valid and does not contains eihter "0" or "1"
  if numbers.nil? || numbers.length != 10 || numbers.count("01") > 0
    p "Not a valid Number and Exiting!"
    return
  end

  # Verify the dictionary file exists or not
  if not File.exist?(FILE_PATH)
    p "Dictionary file does not exist and Exiting"
    return
  end

  # mapping numbers to letters
  letters = {"2" => ["a", "b", "c"], "3" => ["d", "e", "f"], "4" => ["g", "h", "i"], "5" => ["j", "k", "l"],
             "6" => ["m", "n", "o"], "7" => ["p", "q", "r", "s"], "8" => ["t", "u", "v"], "9" => ["w", "x", "y", "z"]}

  dictionary = {}
  (1..20).each {|i| dictionary[i] = []}
  #Read dictionary file and assign values to array
  File.foreach(FILE_PATH) {|word| dictionary[word.length] << word.chop.to_s.downcase}
  # map each number array
  keys = numbers.chars.map {|number| letters[number]}
end

def check_string(string)
  string.scan(/\D/).empty?
end

letter_combinations
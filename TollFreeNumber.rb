require 'byebug'

def letter_combinations(numbers)

  file_path = "dictionary.txt"
  # verify the number is valid and does not contains eihter "0" or "1"
  if numbers.nil? || numbers.length != 10 || numbers.count("01") > 0
    p "Not a valid Number and Exiting!"
  else
    if not File.exist?('dictionary.txt') # Verify the dictionary file exists or not
      p "Dictionary file does not exist and Exiting"
    end
    return
  end

  # mapping numbers to letters
  letters = {"2" => ["a", "b", "c"], "3" => ["d", "e", "f"], "4" => ["g", "h", "i"], "5" => ["j", "k", "l"],
             "6" => ["m", "n", "o"], "7" => ["p", "q", "r", "s"], "8" => ["t", "u", "v"], "9" => ["w", "x", "y", "z"]}


end

letter_combinations("4646525462")
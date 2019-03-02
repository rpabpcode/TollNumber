class Validations
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
    elsif !File.exist?(TollFreeNumber::FILE_PATH)

      # Verify the dictionary file exists or not
      p 'Dictionary file does not exist and Exiting'
      return
    end
    'Valid'
  end
end
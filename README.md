# Welcome  Toll Free Number 

This ruby script ask the user to enter 10 digit phone number, it processes and show the what words of this phone number matches from the given dictionary file.


## Files

 1. tollFreeNumber.rb - Main source code file to process of phone number to words.
 2. validations.rb - Validates the  phone number from the user input.
 3. dictionary.txt - All the words exists in the dictionary  to match against to the number
 4. tollFreeNumber_test.rb - To test the application behavior.
 5. README.txt - Write up  about this project.

## Ruby Version
This is tested under ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]

## System dependencies
The following are required to execute the application.

 1. Ruby - [https://www.ruby-lang.org/en/documentation/installation/](https://www.ruby-lang.org/en/documentation/installation/)
 2. Rspec - [https://github.com/rspec/rspec](https://github.com/rspec/rspec)
 3. Benchmark - This will come with the ruby installtion.

## Getting Started

 - Clone the Repository
 - run the code as
>   ruby tollFreeNumber.rb
  
 - To run the tests
> rspec tollFreeNumber_tests.rb

### Validations

 1. Number should not be empty.
 2. Number should not contain 0 or 1.
 3. Number should have 10 digits, not more or less.
 4. Number should not contain characters or special characters.


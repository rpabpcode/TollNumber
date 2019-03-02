require_relative './tollFreeNumber'
require 'rspec'

RSpec.describe TollFreeNumber do

  it 'should converts 2282668687 phone number to words' do
    expect(TollFreeNumber.new().toll_convert('2282668687')).to match_array([["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["acta", "mounts"], "catamounts"])
  end

  it 'converts 6686787825 phone number to words' do
    expect(TollFreeNumber.new().toll_convert('6686787825')).to match_array([["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"])
  end

  it 'Should raise error message if the phone number contains 0' do
    expect(TollFreeNumber.new().toll_convert('8902540158')).eql?('Not a valid Number and Exiting!')
  end

  it 'Should raise error message if the phone number contains 1' do
    expect(TollFreeNumber.new().toll_convert('8654112548')).eql?('Not a valid Number and Exiting!')
  end

  it 'Should raise error message if no phone number is entered' do
    expect(TollFreeNumber.new().toll_convert('')).eql?('Please enter the phone number.')
  end

  it 'Should raise error message if phone number is more then 10 digits' do
    expect(TollFreeNumber.new().toll_convert('58792456362')).eql?('Not a valid Number and Exiting!')
  end

  it 'Should raise error message if phone number is less then 10 digits' do
    expect(TollFreeNumber.new().toll_convert('587924563')).eql?('Not a valid Number and Exiting!')
  end

  it 'Should raise error message if phone number contains special characters' do
    expect(TollFreeNumber.new().toll_convert('587924563&')).eql?('Plese enter only Numbers!')
  end

end
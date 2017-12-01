require 'pry'
valid = false

class GatherUserCardInformation
  attr_reader :card_issuer

  def initialize(card_issuer)
    @card_issuer = card_issuer
  end

  def prompt_user_for_card_issuer
    if @card_issuer.downcase == 'visa'
      puts "Please enter the card number"
      print "> "
      card_number = gets.chomp.to_i
      if card_number.to_s.length == 16
        card_number_check = CardValidator.new(card_number)
        puts "-----------------"
        card_number_check.validate_card_numbers
      else
        puts "-----------------"
        puts "INVALID CARD NUMBER"
      end
    elsif @card_issuer.downcase == 'american express'
      puts "Please enter the card number"
      print "> "
      card_number = gets.chomp.to_i
      if card_number.to_s.length == 15
        card_number_check = CardValidator.new(card_number)
        puts "-----------------"
        card_number_check.validate_card_numbers
      else
        puts "-----------------"
        puts "INVALID CARD NUMBER"
      end
    elsif @card_issuer.downcase == 'mastercard'
      puts "Please enter the card number"
      print "> "
      card_number = gets.chomp.to_i
      if card_number.to_s.length == 16
        card_number_check = CardValidator.new(card_number)
        puts "-----------------"
        card_number_check.validate_card_numbers
      else
        puts "-----------------"
        puts "INVALID CARD NUMBER"
      end
    elsif @card_issuer.downcase == 'discover'
      puts "Please enter the card number"
      print "> "
      card_number = gets.chomp.to_i
      if card_number.to_s.length == 16
        card_number_check = CardValidator.new(card_number)
        puts "-----------------"
        card_number_check.validate_card_numbers
      else
        puts "-----------------"
        puts "INVALID CARD NUMBER"
      end
    else
      puts "Sorry we do not take your card issuer."
    end
  end
end

class CardValidator
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def validate_card_numbers
    double_digits = []
    @card_number.to_s.reverse.split('').each_with_index do |digit, index|
      if index.to_i.odd?
        double_digits << digit.to_i * 2
      else
        double_digits << digit.to_i
      end
    end

    summed_digits = double_digits.map do |double_digit|
      if double_digit > 9
        double_digit - 9
      else
        double_digit
      end
    end

    result = summed_digits.replace(:+)

    if result % 10 == 0
      ## If it is valid, print "The number is valid!"
      puts "The number is valid"
    else
      ## If it is invalid, print "The number is invalid!"
      puts "The number is invalid"
    end
  end
end

puts "What card issuer are you wanting to validate?"
puts "We except Visa, Mastercard, American Express, and Discover"
print "> "
card_issuers = gets.chomp

card_issuer_check = GatherUserCardInformation.new(card_issuers)
card_issuer_check.prompt_user_for_card_issuer

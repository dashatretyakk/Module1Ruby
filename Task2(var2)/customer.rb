require 'minitest/autorun'

class Customer
  attr_accessor :id, :last_name, :first_name, :middle_name, :address, :credit_card_number, :bank_account_number

  def initialize(id, last_name, first_name, middle_name, address, credit_card_number, bank_account_number)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @address = address
    @credit_card_number = credit_card_number
    @bank_account_number = bank_account_number
  end

  def setId(id)
    @id = id
  end

  def getId
    @id
  end

  def setLastName(last_name)
    @last_name = last_name
  end

  def getLastName
    @last_name
  end

  def setFirstName(first_name)
    @first_name = first_name
  end

  def getFirstName
    @first_name
  end

  def setMiddleName(middle_name)
    @middle_name = middle_name
  end

  def getMiddleName
    @middle_name
  end

  def setAddress(address)
    @address = address
  end

  def getAddress
    @address
  end

  def setCreditCardNumber(credit_card_number)
    @credit_card_number = credit_card_number
  end

  def getCreditCardNumber
    @credit_card_number
  end

  def setBankAccountNumber(bank_account_number)
    @bank_account_number = bank_account_number
  end

  def getBankAccountNumber
    @bank_account_number
  end

  def toString
    "#{@id}: #{@last_name} #{@first_name} #{@middle_name}, #{@address}, #{@credit_card_number}, #{@bank_account_number}"
  end
end

class CustomerTest < Minitest::Test
  def setup
    @customer = Customer.new(1, "Smith", "John", "A.", "123 Main St", "1234-5678-9012-3456", "78901234")
  end

  def test_customer_attributes
    assert_equal 1, @customer.id
    assert_equal "Smith", @customer.last_name
    assert_equal "John", @customer.first_name
    assert_equal "A.", @customer.middle_name
    assert_equal "123 Main St", @customer.address
    assert_equal "1234-5678-9012-3456", @customer.credit_card_number
    assert_equal "78901234", @customer.bank_account_number
  end

  def test_to_string_method
    expected_output = "1: Smith John A., 123 Main St, 1234-5678-9012-3456, 78901234"
    assert_equal expected_output, @customer.toString
  end
end

def customers_sorted_alphabetically(customers)
  customers.sort_by { |customer| [customer.last_name, customer.first_name, customer.middle_name] }
end

def customers_in_credit_card_range(customers, min, max)
  customers.select { |customer| customer.credit_card_number >= min && customer.credit_card_number <= max }
end

customers = [
  Customer.new(1, "Smith", "John", "A.", "123 Main St", "1234-5678-9012-3456", "78901234"),
  Customer.new(2, "Johnson", "Alice", "B.", "456 Elm St", "2345-6789-0123-4567", "56789012"),
  Customer.new(3, "Williams", "Bob", "C.", "789 Oak St", "3456-7890-1234-5678", "67890123"),
  Customer.new(4, "Jones", "Eve", "D.", "101 Pine St", "4567-8901-2345-6789", "78901234"),
  Customer.new(5, "Brown", "Emily", "F.", "222 Cedar St", "5678-9012-3456-7890", "89012345")
]

puts "Список покупців в алфавітному порядку:"
customers_sorted = customers_sorted_alphabetically(customers)
customers_sorted.each do |customer|
  puts customer.toString
end

puts "Введіть мінімальний номер кредитної картки:"
min_credit_card = gets.chomp.to_s
puts "Введіть максимальний номер кредитної картки:"
max_credit_card = gets.chomp.to_s

puts "Список покупців з номерами кредитних карт в заданому інтервалі:"
selected_customers = customers_in_credit_card_range(customers, min_credit_card, max_credit_card)
selected_customers.each do |customer|
  puts customer.toString
end

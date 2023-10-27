require 'minitest/autorun'

def function_f(a, b, c, x)
  result = if a < 0 && c != 0
             a * x**2 + b * x + c
           elsif a > 0 && c == 0
             a * (x + c)
           else
             -a / x - c
           end
  result
end

def calculate_function_values(a, b, c, x_start, x_end, dx)
  values = []
  x = x_start
  while x <= x_end
    f_x = function_f(a, b, c, x)
    values << [x, f_x]
    x += dx
  end
  values
end

class FunctionCalculationTest < Minitest::Test
  def test_function_for_a_lt_0_and_c_not_equal_0
    a, b, c, x_start, x_end, dx = -2, 3, 4, 1, 5, 1
    expected = [
      [1, 5],
      [2, 2],
      [3, -5],
      [4, -16],
      [5, -31]
    ]
    assert_equal expected, calculate_function_values(a, b, c, x_start, x_end, dx)
  end

  def test_function_for_a_gt_0_and_c_equal_0
    a, b, c, x_start, x_end, dx = 2, -3, 0, 1, 5, 1
    expected = [
      [1, 2],
      [2, 4],
      [3, 6],
      [4, 8],
      [5, 10]
    ]
    assert_equal expected, calculate_function_values(a, b, c, x_start, x_end, dx)
  end

  def test_function_for_other_cases
    a, b, c, x_start, x_end, dx = 2, 3, 4, 1, 5, 1
    expected = [
      [1, -6],
      [2, -5],
      [3, -5],
      [4, -5],
      [5, -5]
    ]
    assert_equal expected, calculate_function_values(a, b, c, x_start, x_end, dx)
  end

  def test_function_for_division_by_zero
    a, b, c, x_start, x_end, dx = 2, 3, 0, 1, 5, 1
    expected = [
      [1, 2],
      [2, 4],
      [3, 6],
      [4, 8],
      [5, 10]
    ]
    assert_equal expected, calculate_function_values(a, b, c, x_start, x_end, dx)
  end

  def test_function_for_other_cases_with_float_values
    a, b, c, x_start, x_end, dx = -1.5, 0.5, -0.5, 1, 5, 1
    expected = [
      [1, -1.5],
      [2, -5.5],
      [3, -12.5],
      [4, -22.5],
      [5, -35.5]
    ]
    assert_equal expected, calculate_function_values(a, b, c, x_start, x_end, dx)
  end
end


puts "Введіть значення a:"
a = gets.to_f

puts "Введіть значення b:"
b = gets.to_f

puts "Введіть значення c:"
c = gets.to_f

puts "Введіть початкове значення Xпоч.:"
x_start = gets.to_f

puts "Введіть кінцеве значення Xкін.:"
x_end = gets.to_f

puts "Введіть крок dX:"
dx = gets.to_f

values = calculate_function_values(a, b, c, x_start, x_end, dx)


puts "X\t\tF(X)"
values.each { |x, f_x| puts "#{x}\t\t#{f_x}" }

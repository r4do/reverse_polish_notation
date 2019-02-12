require 'readline'

OPERATORS = ['+', '-', '*', '/']

def reverse_polish_notation(stack_, input_string)
  result = stack_.dup
  begin
    elements = input_string.split(/\s/)
    elements.each do |elem|
      if OPERATORS.include?(elem)
        operand1, operand2 = stack_.pop(2)
        stack_.push operand1.send(elem, operand2)
      else
        stack_.push Float(elem)
      end
    end
    puts stack_.last
    result = stack_
  rescue ArgumentError => exception
    puts 'Numbers and operators are only allowed'
  rescue NoMethodError => exception
    puts 'Not enough elements in stack'
  ensure
    return result
  end
end

stack = []
while (input = Readline.readline("> ", true)) && input != 'q'
  stack = reverse_polish_notation(stack, input)
end

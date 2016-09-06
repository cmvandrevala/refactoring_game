class Codebase

  attr_reader :complexity

  MINIMUM_COMPLEXITY = 1

  def initialize(starting_complexity = MINIMUM_COMPLEXITY)
    @complexity = starting_complexity
  end

  def increase_complexity(amount = 0)
    @complexity += amount if valid_input(amount)
  end

  def decrease_complexity(amount = 0)
    @complexity -= amount if valid_input(amount)
  end

  private

  def valid_input(amount)
    amount > 0
  end

end
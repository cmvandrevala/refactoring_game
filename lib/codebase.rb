class Codebase

  attr_reader :complexity

  def initialize
    @complexity = 0
  end

  def increase_complexity(amount = 0)
    @complexity += amount if amount > 0
  end

  def decrease_complexity(amount = 0)
    @complexity -= amount if amount > 0
  end

end
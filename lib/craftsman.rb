class Craftsman

  attr_reader :maximum_achievable_work

  MINIMUM_ACHIEVABLE_COMPLEXITY = 1

  def initialize(maximum_achievable_work = 1)
    @maximum_achievable_work = maximum_achievable_work
  end

  def work_on_feature(complexity)
    return @maximum_achievable_work if negligible_complexity(complexity)
    @maximum_achievable_work*Math.exp(-complexity.to_f)
  end

  def refactor(complexity)
    return 0 if negligible_complexity(complexity)
    @maximum_achievable_work/complexity.to_f
  end

  private

  def negligible_complexity(complexity)
    complexity <= MINIMUM_ACHIEVABLE_COMPLEXITY
  end

end
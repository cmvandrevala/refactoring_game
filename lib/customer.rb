class Customer

  attr_reader :satisfaction

  DISTRIBUTION_OFFSET = 0.01
  MINIMUM_SATISFACTION = 0
  STARTING_SATISFACTION = 10
  SATISFACTION_STEP = 1

  def initialize
    @satisfaction = STARTING_SATISFACTION
  end

  def increase_satisfaction
    @satisfaction += SATISFACTION_STEP
  end

  def decrease_satisfaction
    @satisfaction -= SATISFACTION_STEP unless game_over
  end

  def assign_story(mean = 1)
    -mean*Math.log(1-Kernel.rand) + DISTRIBUTION_OFFSET
  end

  private

  def game_over
    @satisfaction <= MINIMUM_SATISFACTION
  end

end
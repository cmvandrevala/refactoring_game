class Customer

  attr_reader :satisfaction
  DISTRIBUTION_OFFSET = 0.01

  def initialize
    @satisfaction = 10
  end

  def increase_satisfaction
    @satisfaction += 1
  end

  def decrease_satisfaction
    @satisfaction -= 1 if @satisfaction > 0
  end

  def assign_story(mean = 1)
    -mean*Math.log(1-Kernel.rand) + DISTRIBUTION_OFFSET
  end

end
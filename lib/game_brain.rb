class GameBrain

  attr_reader :current_progress_with_feature
  attr_reader :feature_difficulty, :features_implemented

  def initialize
    @feature_difficulty = 1
    @features_implemented = 0
    @current_progress_with_feature = 0
  end

  def feature_difficulty=(diff)
    @feature_difficulty = diff if valid_difficulty(diff)
  end

  def update_progress(amount)
    @current_progress_with_feature += amount
    if @current_progress_with_feature > @feature_difficulty
      reset_progress_to_zero
      increment_features_implemented
    end
  end

  private

  def valid_difficulty(difficulty)
    difficulty > 0
  end

  def reset_progress_to_zero
    @current_progress_with_feature = 0
  end

  def increment_features_implemented
    @features_implemented += 1
  end

end
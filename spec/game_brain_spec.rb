require "game_brain"

describe GameBrain do

  before(:each) do
    @game = GameBrain.new
  end

  describe "#feature_difficulty" do

    it "has a default value of 1" do
      expect(@game.feature_difficulty).to eq 1
    end

    it "can be updated" do
      @game.feature_difficulty = 12
      expect(@game.feature_difficulty).to eq 12
    end

    it "cannot be zero" do
      @game.feature_difficulty = 0
      expect(@game.feature_difficulty).to eq 1
    end

    it "cannot be negative" do
      @game.feature_difficulty = -1
      expect(@game.feature_difficulty).to eq 1
    end

  end

  describe "#current_progress_with_feature" do

    it "starts off with a current progress of zero" do
      expect(@game.current_progress_with_feature).to eq 0
    end

    it "can be updated by a value below the feature_difficulty" do
      @game.update_progress(0.2)
      expect(@game.current_progress_with_feature).to eq 0.2
    end

    it "can be updated multiple times" do
      3.times { @game.update_progress(0.17) }
      expect(@game.current_progress_with_feature).to eq 0.51
    end

    it "resets to zero after the feature is complete" do
      @game.update_progress(31)
      expect(@game.current_progress_with_feature).to eq 0
    end

  end

  describe "#features_implemented" do

    it "starts at zero" do
      expect(@game.features_implemented).to eq 0
    end

    it "does not increment if work is not finished on the feature" do
      @game.update_progress(0.2)
      expect(@game.features_implemented).to eq 0
    end

    it "can be increased by one" do
      @game.update_progress(2)
      expect(@game.features_implemented).to eq 1
    end

    it "can be increased multiple times" do
      @game.update_progress(2)
      @game.update_progress(0.5)
      @game.update_progress(0.7)
      expect(@game.features_implemented).to eq 2
    end

  end

end
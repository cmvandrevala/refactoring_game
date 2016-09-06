require "craftsman"

describe Craftsman do

  before(:each) do
    @craftsman = Craftsman.new
    @advanced_craftsman = Craftsman.new(10)
  end

  describe "#initialize" do

    it "starts off with a maximum achievable work of 1" do
      expect(@craftsman.maximum_achievable_work).to eq 1
    end

    it "can be initialized with a different value for maximum achievable work" do
      expect(@advanced_craftsman.maximum_achievable_work).to eq 10
    end

  end

  describe "#work_on_feature" do

    it "can easily build features in a codebase with no complexity" do
      expect(@craftsman.work_on_feature(0)).to eq 1
    end

    it "can easily build features in a codebase with little complexity" do
      expect(@craftsman.work_on_feature(1)).to eq 1
    end

    it "can build features in a codebase with medium amount of complexity" do
      expect(@craftsman.work_on_feature(5)).to eq 0.006737946999085467
    end

    it "builds features at a constant rate for a complexity between 0 and 1" do
      expect(@craftsman.work_on_feature(0.8)).to eq 1
    end

    it "does not make much progress if the codebase is very complicated" do
      expect(@craftsman.work_on_feature(170)).to eq 1.4788975056432133e-74
    end

    it "takes maximum achievable work into account" do
      expect(@advanced_craftsman.work_on_feature(14)).to eq 8.315287191035679e-06
    end

  end

  describe "#refactor" do

    it "cannot refactor a codebase with no complexity" do
      expect(@craftsman.refactor(0)).to eq 0
    end

    it "cannot refactor a codebase with a complexity of one" do
      expect(@craftsman.refactor(1)).to eq 0
    end

    it "cannot refactor a codebase with a complexity between 0 and 1" do
      expect(@craftsman.refactor(0.65)).to eq 0
    end

    it "can reduce a portion of the complexity of the code" do
      expect(@craftsman.refactor(2)).to eq 0.5
    end

    it "takes maximum achievable work into account" do
      expect(@advanced_craftsman.refactor(14)).to be_between(0.714, 0.715).inclusive
    end

  end

end
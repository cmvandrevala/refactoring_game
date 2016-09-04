require "codebase"

describe Codebase do

  before(:each) do
    @codebase = Codebase.new
  end

  describe "complexity of the codebase" do

    context "#initizlization" do

      it "starts off with a complexity of zero" do
        expect(@codebase.complexity).to eq 0
      end

    end

    context "#increase_complexity" do

      it "can be increased by 10" do
        @codebase.increase_complexity(10)
        expect(@codebase.complexity).to eq 10
      end

      it "can be increased by 4.73725" do
        @codebase.increase_complexity(4.73725)
        expect(@codebase.complexity).to eq 4.73725
      end

      it "does nothing for an increase of 0" do
        @codebase.increase_complexity(0)
        expect(@codebase.complexity).to eq 0
      end

      it "does nothing if there is no input" do
        @codebase.increase_complexity
        expect(@codebase.complexity).to eq 0
      end

      it "does nothing if the input is less than zero" do
        @codebase.increase_complexity(-5)
        expect(@codebase.complexity).to eq 0
      end

    end

    context "#decrease_complexity" do

      before(:each) do
        @codebase.increase_complexity(10)
      end

      it "can be decreased by 1" do
        @codebase.decrease_complexity(1)
        expect(@codebase.complexity).to eq 9
      end

      it "can be decreased by 1.00234" do
        @codebase.decrease_complexity(1.00234)
        expect(@codebase.complexity).to eq 8.99766
      end

      it "does nothing for an decrease of 0" do
        @codebase.decrease_complexity(0)
        expect(@codebase.complexity).to eq 10
      end

      it "does nothing if there is no input" do
        @codebase.decrease_complexity
        expect(@codebase.complexity).to eq 10
      end

      it "does nothing if the input is less than zero" do
        @codebase.decrease_complexity(-5)
        expect(@codebase.complexity).to eq 10
      end

    end

  end

end
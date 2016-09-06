require "codebase"

describe Codebase do

  before(:each) do
    @codebase = Codebase.new
  end

  describe "complexity of the codebase" do

    context "#initizlization" do

      it "starts off with a default minimum complexity of one" do
        expect(@codebase.complexity).to eq 1
      end

      it "can be initialized with a different starting complexity" do
        new_codebase = Codebase.new(5)
        expect(new_codebase.complexity).to eq 5
      end

    end

    context "#increase_complexity" do

      it "can be increased by 10" do
        @codebase.increase_complexity(10)
        expect(@codebase.complexity).to eq 11
      end

      it "can be increased by 4.73725" do
        @codebase.increase_complexity(4.73725)
        expect(@codebase.complexity).to eq 5.73725
      end

      it "does nothing for an increase of 0" do
        @codebase.increase_complexity(0)
        expect(@codebase.complexity).to eq 1
      end

      it "does nothing if there is no input" do
        @codebase.increase_complexity
        expect(@codebase.complexity).to eq 1
      end

      it "does nothing if the input is less than zero" do
        @codebase.increase_complexity(-5)
        expect(@codebase.complexity).to eq 1
      end

    end

    context "#decrease_complexity" do

      before(:each) do
        @complex_codebase = Codebase.new(11)
      end

      it "can be decreased by 1" do
        @complex_codebase.decrease_complexity(1)
        expect(@complex_codebase.complexity).to eq 10
      end

      it "can be decreased by 1.00234" do
        @complex_codebase.decrease_complexity(1.00234)
        expect(@complex_codebase.complexity).to eq 9.99766
      end

      it "does nothing for an decrease of 0" do
        @complex_codebase.decrease_complexity(0)
        expect(@complex_codebase.complexity).to eq 11
      end

      it "does nothing if there is no input" do
        @complex_codebase.decrease_complexity
        expect(@complex_codebase.complexity).to eq 11
      end

      it "does nothing if the input is less than zero" do
        @complex_codebase.decrease_complexity(-5)
        expect(@complex_codebase.complexity).to eq 11
      end

    end

  end

end
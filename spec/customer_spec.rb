require 'customer'

describe Customer do

  before(:each) do
    @customer = Customer.new
  end

  describe "#satisfaction" do

    it "starts off with ten units of satisfaction" do
      expect(@customer.satisfaction).to eq 10
    end

    it "can be incremented by one" do
      @customer.increase_satisfaction
      expect(@customer.satisfaction).to eq 11
    end

    it "can be decremented by one" do
      @customer.decrease_satisfaction
      expect(@customer.satisfaction).to eq 9
    end

    it "cannot be lower than zero" do
      20.times { @customer.decrease_satisfaction }
      expect(@customer.satisfaction).to eq 0
    end

  end

  describe "#assign_story" do

    it "never returns a story with a point value less than or equal to zero" do
      expect(@customer.assign_story).to be > 0
    end

    it "returns stories with a point value close to zero" do
      allow(Kernel).to receive(:rand).and_return(0.1)
      expect(@customer.assign_story).to be_between(0.115, 0.116).inclusive
    end

    it "returns stories with a point value farther from zero" do
      allow(Kernel).to receive(:rand).and_return(0.5)
      expect(@customer.assign_story).to be_between(0.703, 0.704).inclusive
    end

    it "returns stories with a point value very far from zero" do
      allow(Kernel).to receive(:rand).and_return(0.99)
      expect(@customer.assign_story).to be_between(4.615, 4.616).inclusive
    end

    it "can adjust the score distribution with a specified mean" do
      allow(Kernel).to receive(:rand).and_return(0.2)
      expect(@customer.assign_story(10)).to be_between(2.241, 2.242).inclusive
    end

  end

end
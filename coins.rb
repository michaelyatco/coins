# Exercise: Pair up on the following using ’ping-pong’ style: i.e. Developer A creates a test, Developer B writes the code, Developer B writes the next test, Developer A writes the code. Use only one of your group’s laptops for this exercise, and take turns driving.

# You will be creating a method that will take a number of cents and return an array of coins that will be your change. The goal is to return as few coins as possible. Assume that the highest denomination of coins will be a quarter (25 cents). For example: If the method receives 119, the result will be [25, 25, 25, 25, 10, 5, 1, 1, 1, 1]


require 'rspec'

class ChangeMachine

  def change(money)
    change_array = []
    if money == 1
      change_array << money
    elsif money == 5
      change_array << money
    elsif money == 10
      change_array << money
    elsif money == 25
      change_array << money
    elsif money % 5 == 1
      change_array << 5
      money = money - 5
      change_array << money
    end
  end
end


RSpec.describe ChangeMachine do
  describe '#change' do
    it "should return an array with 1" do
      cm = ChangeMachine.new
      expect(cm.change(1)).to eq([1]) 
    end

    it "should return an array with 5" do
      cm = ChangeMachine.new
      expect(cm.change(5)).to eq([5]) 
    end

    it "should return an array with 10" do
      cm = ChangeMachine.new
      expect(cm.change(10)).to eq([10]) 
    end

    it "should return an array with 25" do
      cm = ChangeMachine.new
      expect(cm.change(25)).to eq([25]) 
    end  

    it "should return an array of 25 and 1" do  
      cm = ChangeMachine.new
      expect(cm.change(6)).to eq([5,1])
    end
  end
end
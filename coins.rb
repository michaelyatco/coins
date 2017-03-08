# Exercise: Pair up on the following using ’ping-pong’ style: i.e. Developer A creates a test, Developer B writes the code, Developer B writes the next test, Developer A writes the code. Use only one of your group’s laptops for this exercise, and take turns driving.

# You will be creating a method that will take a number of cents and return an array of coins that will be your change. The goal is to return as few coins as possible. Assume that the highest denomination of coins will be a quarter (25 cents). For example: If the method receives 119, the result will be [25, 25, 25, 25, 10, 5, 1, 1, 1, 1]

require 'pry'
require 'rspec'

class ChangeMachine

  def change(money)
    coins = []
  #   while money > 0
  #     if money >= 25
  #       coins << 25
  #       money -= 25
  #     elsif money >= 10
  #       coins << 10
  #       money -= 10
  #     elsif money >= 5
  #       coins << 5
  #       money -= 5
  #     else 
  #       coins << 1
  #       money -= 1
  #     end
  #   end
  #   return coins
  # end

    coins = [25, 10, 5, 1]
    change = []
    coins.each do |coin|
      change.concat([coin] * (money/coin))
      money = money - (coin * (money/coin)) 
    end
    change.concat([1] * money)
    return change
  end

  #   denominations = [25, 10, 5, 1]
  #   denominations.each do |denomination|
  #     while money >= denomination
  #       coins << denomination
  #       money -= denomination
  #     end
  #   end
  #   return coins
  # end
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

    it "should return an array of 5 and 1" do  
      cm = ChangeMachine.new
      expect(cm.change(6)).to eq([5,1])
    end

    it "should return an array of 5, 1, and 1" do
      cm = ChangeMachine.new
      expect(cm.change(7)).to eq([5,1,1])
    end

    it "should return an array of 25, 10, 5, and 1" do
      cm = ChangeMachine.new
      expect(cm.change(41)).to eq([25,10,5,1])
    end
  end
end
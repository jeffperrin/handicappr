require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :rounds
  should_validate_presence_of :username
  
  context "User with no rounds" do
    setup do
      @user = UserFactory.create!
    end
    should "have no rounds" do
      assert @user.rounds.empty?
    end
    should "have no handicap" do
      assert @user.handicap.nil?
    end
  end
  
  context "User with one round" do
    setup do
      @user = RoundFactory.create! do |r|
        r.slope = 120
        r.rating = 70
        r.score = 80
      end.user
    end
    should "have a round" do
      assert_equal 1, @user.rounds.size
    end
    should "have a handicap" do
      assert_big_decimal 9.0, @user.handicap
    end
  end
  context "User with 6 rounds" do
    setup do
      @user = UserFactory.create!
      RoundFactory.create_many!(@user, [[120, 70, 75], [120, 70, 80], [120, 70, 90], 
        [120, 70, 90], [120, 70, 90], [120, 70, 90]])
    end
    should "have 6 rounds" do
      assert_equal 6, @user.rounds.size
    end
    should "use the round with the lowest differential for the handicap" do
      assert_big_decimal 4.5, @user.handicap
    end
  end
  context "User with 7 rounds" do
    setup do
      @user = UserFactory.create!
      RoundFactory.create_many!(@user, [[120, 70, 70], [120, 70, 78], [120, 70, 80], [120, 70, 90], 
        [120, 70, 90], [120, 70, 90], [120, 70, 90]])
    end
    should "use the average of the 2 rounds with the lowest differential for the handicap" do
      assert_big_decimal 3.6, @user.handicap
    end
  end
end
require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  should_belong_to :user

  should_validate_numericality_of :slope
  should_validate_numericality_of :rating
  should_validate_numericality_of :score

  should_validate_presence_of :slope
  should_validate_presence_of :rating
  should_validate_presence_of :score
  
  context "calculating a differential" do
    setup do
      @round = RoundFactory.create! do |r|
        r.slope = 120
        r.rating = 70
        r.score = 85
      end
    end
    should "calculate the diff" do
      assert_equal BigDecimal('14.1'), @round.differential
    end
  end
end

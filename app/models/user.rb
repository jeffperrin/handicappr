class User < ActiveRecord::Base
  include Clearance::User
  
  attr_accessible :username, :full_name, :location, :home_page  
  has_many :rounds
  
  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false
  
  def recent_rounds(page, per_page=10)
    Round.paginate_by_user_id(id, :page => page, :order => 'updated_at DESC', :per_page => per_page)
  end
  
  def has_just_been_created?
    return rounds.empty?
  end
  
  def handicap
    rounds.empty? ? nil : calculate_average(recent_rounds_for_handicap_calculation.first(num_rounds_to_average))
  end
  
  def recent_rounds_for_handicap_calculation
    r = Round.recent(20).for_user(self)
    r.sort { |a, b| a.differential <=> b.differential }
  end
  
  def num_rounds_to_average
    case rounds.size
      when 1..6   then 1
      when 7..8   then 2
      when 9..10  then 3
      when 11..12 then 4
      when 13..14 then 5
      when 15..16 then 6
      when 17     then 7
      when 18     then 8
      when 19     then 9
      else 10
    end
  end
  
  protected
  def calculate_average(rounds)
    ((rounds.sum(&:differential) / BigDecimal(rounds.size.to_s)) * BigDecimal('0.96')).round(1)
  end
end

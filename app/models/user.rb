class User < ActiveRecord::Base
  include Clearance::User
  
  attr_accessible :name  
  has_many :rounds
  validates_presence_of :name
  
  def handicap
    #rounds = Rounds.all(:conditions => { :user_id => id }, :limit => 20, :order => 'created_at DESC, differential ASC')
    rounds_to_avg = recent_rounds.first(num_rounds_to_average)
    rounds.empty? ? nil : avg_rounds(rounds_to_avg)
  end
  
  def recent_rounds
    r = Round.all(:conditions => { :user_id => id }, :limit => 20, :order => 'created_at DESC')
    r.sort{ |a,b| a.differential <=> b.differential }
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
  def avg_rounds(shizz)
    ((shizz.sum(&:differential) / BigDecimal(shizz.size.to_s)) * BigDecimal('0.96')).round(1)
  end
end

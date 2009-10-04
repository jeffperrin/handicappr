class Round < ActiveRecord::Base
  belongs_to :user

  validates_numericality_of :slope, :rating, :score
  validates_presence_of :slope, :rating, :score
  
  before_save :calculate_differential
  
  named_scope :recent, lambda { |limit|
    { :limit => limit, :order => 'played_on DESC, created_at DESC' }
  }
  named_scope :for_user, lambda { |user|
    { :conditions => { :user_id => user.id } }
  }
  
  protected
  def calculate_differential
    self.differential = ((BigDecimal(score.to_s) - BigDecimal(rating.to_s)) * 
      BigDecimal('113') / BigDecimal(slope.to_s)).round(1)
  end

end

class UserFactory < ObjectMother::Factory
  def self.spawn
    User.new
  end
  def self.populate(model)
    model.name = unique('Jim Smith')
    model.email = unique_email('john@smith.com')
    model.password = '1234'
  end
end
class RoundFactory < ObjectMother::Factory
  def self.spawn
    Round.new
  end
  def self.populate(model)
    model.slope = 120
    model.rating = 70
    model.score = 90
    model.user = UserFactory.create!
  end
  def self.create_many!(user, rounds=[])
    rounds.each do |r|
      round = spawn
      round.slope = r[0]
      round.rating = r[1]
      round.score = r[2]
      round.user = user
      round.save!
    end
  end
end


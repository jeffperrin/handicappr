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


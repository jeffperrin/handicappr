Feature: Round Management
  In order to calculate a golfer's handicap
  A user
  Should be able to enter information about past rounds

   Scenario: User signs in for the first time
      Given I am signed in as "jeff/email@person.com/password"
      Then I should now be on the home page for "jeff"
      And I should see "Welcome to Handicappr, jeff"
      And I should see "Start by entering the slope, rating and score from your recent rounds of golf"
      And I should see "No handicap"
      
    Scenario: User can enter a round
      Given I am signed in as "jeff/email@person.com/password"
      And I fill in "Slope" with "120"
      And I fill in "Rating" with "70"
      And I fill in "Score" with "90"
      And I press "Save"
      Then I should now be on the home page for "jeff"
      And I should not see "No handicap"
      And I should see "Your handicap is"
      
    Scenario: User signs in after entering at least one round
      Given I am signed in as "jeff/email@person.com/password"
      And I have at least 1 round
      When I go to the homepage
      Then I should not see "Start by entering the slope, rating and score from your recent rounds of golf"
      And I should see "Welcome to Handicappr"


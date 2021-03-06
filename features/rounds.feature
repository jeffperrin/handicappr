Feature: Round Management
  In order to calculate a golfer's handicap
  A user
  Should be able to enter information about past rounds

   Scenario: User signs in for the first time
      Given I am signed in as "jeff/email@person.com/password"
      Then I should now be on the home page for "jeff"
      And I should see "Welcome to Handicappr, jeff"
      And I should see "Start by entering the slope, rating and score from your recent rounds of golf"
      And I should see "N/A"
      
    Scenario: User can enter a round
      Given I have signed in with "jeff/email@person.com/password"
      And I fill in "Slope" with "120"
      And I fill in "Rating" with "70"
      And I fill in "Score" with "90"
      And I press "Save"
      Then I should now be on the home page for "jeff"
      And I should not see "N/A"
      And I should see "18.0"
      
    Scenario: User signs in after entering at least one round
      Given I am signed in as "jeff/email@person.com/password"
      And I have at least 1 round
      When I go to the homepage
      Then I should not see "Start by entering the slope, rating and score from your recent rounds of golf"
      And I should see "Welcome to Handicappr"
      
    Scenario: User with one round can view past rounds
      Given I have signed in with "jeff/j@p.com/1234"
      And I have at least 1 round
      And I follow "History"
      Then I should see "Played On"

    Scenario: User with no rounds can view past rounds
      Given I have signed in with "jeff/j@p.com/1234"
      And I follow "History"
      Then I should see "No rounds have been entered"
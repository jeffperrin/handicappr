Feature: Search Golfers
  A user, either logged in or not,
  should be able to search for golfers

  Scenario: User navigates to search page
    Given I go directly to the url /search
    Then I should see "Search for a golfer"
    And I should not see "Results"
  
  Scenario: User searches for a golfer by username
    Given a user named "Pasquale" exists
    And I search for users with "Pas"
    Then I should see "Results for Pas:"
    And I should see "Pasquale"
    
  Scenario: Logged in user performs a search
    Given I have signed in with "jefferson/email@person.com/password"
    And a user named "jeffery" exists
    And I go directly to the url /search
    And I fill in "Find a golfer" with "jeff"
    And I press "Search"
    Then I should see "Results for jeff:"
    And I should see "jeffery"
    But I should not see "jefferson"
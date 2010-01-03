Feature: Search Golfers
  A user, either logged in or not,
  should be able to search for golfers

  Scenario: User navigates to search page
    Given I go directly to the url /search
    Then I should see "Search for a golfer"
    And I should not see "Results"
  
  Scenario: User searches for a golfer by username
    Given a user named "Pasquale" exists
    And I go directly to the url /search
    And I fill in "Find a golfer" with "Pasquale"
    And I press "Search"
    Then I should see "Results for Pasquale:"
    And I should see ""
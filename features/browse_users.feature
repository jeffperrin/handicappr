Feature: Browsing Users
  A user, either logged in or not,
  should be able to view any other user's handicap info

  Scenario: User navigates to page for user who doesn't exist
    Given I go directly to the url /golfer/idontexist
    Then I should see "No user named idontexist exists"
      
  Scenario: User navigates to a users page with no handicap
    Given a user named "Pasquale" exists
    And I go directly to the url /golfer/Pasquale
    Then I should see "Pasquale does not yet have a handicap"
    And I should see "No rounds have been entered"

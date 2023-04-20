Feature: Board functionality

  Rule: Happy paths

    Background: Empty board page
      Given I am on empty home page

    Scenario: Opening a board
      When I type in "new board" and submit
      Then I should be redirected to the board detail

@task2
Feature: Individual task2
  As a test engineer
  I want to be able to write and execute scenario outlines and scenarios

  Background:
    Given I am on enter the people with jobs page

  Scenario Outline: Adding a new person
    When I click add person button
    And I enter input
      | name    | <name>  |
      | job     | <job>   |
    And I click add button
    Then I can see name "<name>" added in the list
    And I can see job "<job>" added in the list
    Examples:
      | name  | job       |
      | Billy | Manager   |

  Scenario: Editing a person
    When I click on pencil icon near name
    And I enter input
      | name    | Ruth       |
      | job     | Assistant  |
    And I click edit button
    Then I can see edited name "Ruth" added in the list
    And I can see edited job "Assistant" added in the list

  Scenario: Removing a person
    When I click on x icon near name
    Then I can no longer see this persons name and job in the list

  Scenario: Clearing fields while adding a user
    When I click add person button
    And I enter input
      | name    | Tom        |
      | job     | Developer  |
    Then I click Clear all fields button
    And I see empty input fields

  Scenario Outline: Reset after adding new person
    When I click add person button
    And I enter input
      | name    | <name>  |
      | job     | <job>   |
    And I click add button
    Then I can see name "<name>" added in the list
    And I can see job "<job>" added in the list
    Then I click reset list
    And I check if I see list without a new person
    Examples:
      | name  | job       |
      | Billy | Manager   |

  Scenario: Reset after editing a person
    When I click on pencil icon near name
    And I enter input
      | name    | Ruth       |
      | job     | Assistant  |
    And I click edit button
    Then I can see edited name "Ruth" added in the list
    And I can see edited job "Assistant" added in the list
    Then I click reset list
    And I check if I see list without edited details

  Scenario: Reset after removing a person
    When I click on x icon near name
    Then I can no longer see this persons name and job in the list
    Then I click reset list
    And I see this person again in the list

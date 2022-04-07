@regression @part4
Feature: Introduction to cucumber part 4
  As a test engineer
  I want to be able to write and execute a scenario with steps that have 2 column tables

  Background:
    Given I am on age page

  Scenario: a new scenario with 2-column table
    When I enter values:
      | name | Ann |
      | age  | 5   |
    And I click submit age
    Then I see message: "Hello, Ann, you are a kid"

  Scenario: another new scenario with 2-column table
    When I enter values:
      | name | Bob |
      | age  | 61  |
    And I click submit age
    Then I see message: "Hello, Bob, you are an adult"

  Scenario Outline: a new scenario outline 2
    When I enter values:
      | name | <name> |
      | age  | <age>  |
    And I click submit age
    Then I see message: "<message>"
    Examples:
      | name | age | message                      |
      | Ann  | 5   | Hello, Ann, you are a kid    |
      | Bob  | 61  | Hello, Bob, you are an adult |

# TODO - create Scenario for 'Give us your feedback!' page
  # URL: https://kristinek.github.io/site/tasks/provide_feedback
  # Navigate to page
  # Set Name, Age and Genre
  # - All input MUST be done in single step
  # - Step can use Map or Domain object
  # Click "Send" button and verify that previous input is displayed in correct fields

  @feedback
  Scenario: Feedback with name, age and gender
    Given I am on provide feedback page
    When I enter input in feedback page
      | name    | Billy  |
      | age     | 33     |
      | genre   | male   |
    And I click send button
    Then I can see name "Billy" in the feedback check
    And I can see age "33" in the feedback check
    And I can see genre "male" in feedback check

    # TODO - create Scenario Outline for 'Give us your feedback!' page
  # URL: https://kristinek.github.io/site/tasks/provide_feedback
  # Navigate to page
  # Set Name, Age and Genre
  # - All input MUST be done in single step
  # - All input MUST use Examples for data
  # - Step can use Map or Domain object
  # Click "Send" button and verify that previous input is displayed in correct fields

  @feedback2
  Scenario Outline: Feedback with name, age and gender
    Given I am on provide feedback page
    When I enter input in feedback page
      | name    | <name>  |
      | age     | <age>   |
      | genre   | <genre> |
    And I click send button
    Then I can see name "<name>" in the feedback check
    And I can see age "<age>" in the feedback check
    And I can see genre "<genre>" in feedback check
    Examples:
      | name  | age | genre  |
      | Billy | 33  | male   |
      | Ruth  | 18  | female |

#additional: input as data table
  Scenario: Feedback with name, age and gender
    Given I am on provide feedback page
    When I enter input in feedback page as data table
      | name  | age | genre  |
      | Billy | 33  | male   |
    And I click send button
    Then I can see name "Billy" in the feedback check
    And I can see age "33" in the feedback check
    And I can see genre "male" in feedback check
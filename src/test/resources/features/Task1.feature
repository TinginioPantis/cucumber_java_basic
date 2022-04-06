@individualTask1
Feature: Individual task1
  As a test engineer
  I want to be able to write and execute a scenario outline and a scenario

  Background:
    Given I am on enter a number page

  Scenario Outline: Error cases in a number page: number too small, number too big, text instead of the number
    When I enter number in a number page: "<number>"
    And I click submit button
    Then I see message: "<message>" above submit button
    Examples:
      | number | message               |
      | 7      | Number is too small   |
      | 107    | Number is too big     |
      | aaa    | Please enter a number |

  Scenario: Correct number in a number page
    When I enter number: 55
    And I click submit button
    Then I see alert message: "Square root of 55 is 7.42"
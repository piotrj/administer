Feature: Listing Posts
  In order to read blog
  As a blog guest
  I want to be able to list posts

  Scenario: List all blog posts
    Given following posts exists:
      | title                   | body                      |
      | How to raise your kid   | You should be good parent |
      | How to make great coffe | Add whipped cream to it   |
    When I am on the home page
    Then I should see "How to raise your kid"
    And I should see "You should be good parent"
    And I should see "How to make great coffe"
    And I should see "Add whipped cream to it"

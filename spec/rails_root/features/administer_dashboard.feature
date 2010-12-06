Feature: Listing Posts
  In order to administer the blog
  I want to use administration dashboard

  Scenario: Viewing Dashboard page
    When I am on the administer dashboard page
    Then I should see "Administer Dashboard"
    And I should see "Models List"
    And I should see "Posts"

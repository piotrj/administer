Feature: Managing posts via administer
  In order to make sure administer works
  I want to be able to manage posts via administer

  Scenario: Listing posts
    Given following posts exists:
      | title                   | body                      |
      | How to raise your kid   | You should be good parent |
    When I am on the administer dashboard page
    And I follow "Posts"
    Then I should see "How to raise your kid"
    And I should see "You should be good parent"

  Scenario: Creating posts
    Given following categories exist:
      | name          |
      | Awesome Posts |
    Given following comments exist:
      | body          |
      | First comment |
      | What is this? |
    When I am on administer posts list
    And I follow "New Post"
    Then I should see textfield with label "Title"
    And I should see textarea with label "Body"
    And I should see dateselect with label "Publish on"
    And I should see select with label "Category"
    And I should see checkbox with label "First comment"
    And I should see checkbox with label "What is this"
    And I fill in "Title" with "How to raise your kid"
    And I fill in "Body" with "You should be good parent."
    And I select "Awesome Posts" from "Category"
    And I press "Create Post"
    Then I should be on administer posts list
    And following posts should exist:
      | title                   | body                      | category_name   |
      | How to raise your kid   | You should be good parent. | Awesome Posts   |

  Scenario: Creating invalid post
    Given following categories exist:
      | name          |
      | Awesome Posts |
    When I am on administer posts list
    And I follow "New Post"
    Then I fill in "Body" with "Post without title"
    And I press "Create Post"
    Then I should see "can't be blank"
    And there should be no posts

  Scenario: Editing Posts
    Given following posts exists:
      | title                   | body                      |
      | How to raise your kid   | You should be good parent |
    When I am on administer posts list
    And I follow "Edit"
    Then I fill in "Title" with "Can we?"
    And I fill in "Body" with "Yes, we can"
    And I press "Update Post"
    Then I should be on administer posts list
    And following posts should exist:
      | title     | body        |
      | Can we?   | Yes, we can |

  Scenario: Deleting post
    Given following posts exists:
      | title                   | body                      |
      | How to raise your kid   | You should be good parent |
    When I am on administer posts list
    And I press "Delete"
    Then I should be on administer posts list
    And there should be no posts

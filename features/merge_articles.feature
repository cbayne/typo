Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge two similar articles

  Background: 
    Given the blog is set up
    And I am logged into the admin panel

    Given the following articles exist:
    | id |       author     |                 title                    |   type  |	body		    |
    | 3  |   Aaron Miller   | Why bears are America's greatest threat. | Article | Bears are unethical      |
    | 4  |  Christina Bayne | Bears: Corrupting America's youth.       | Article | Bears are bad influences |

Scenario: Merge two articles.
  Given I am on the edit page for article 3
  And I fill in "merge_with" with "4"
  And I press "Merge" 
  Then the title should be "Why bears are America's greatest threat."
  And the author should be "Aaron Miller"
  And the body should contain "Bears are unethical" and "Bears are bad influences"
  

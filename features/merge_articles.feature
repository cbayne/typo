Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge two similar articles

  Background: 
    Given the blog is set up
    And I am logged into the admin panel

    Given the following articles exist:
    | id |       author     |                 title                    |   type  |	body		    |
    | 4  |   Aaron Miller   | Why bears are America's greatest threat. | Article | Bears are unethical      |
    | 5  |  Christina Bayne | Bears: Corrupting America's youth.       | Article | Bears are bad influences |

Scenario: Merge two articles.
  Given I am on the edit page for article 4
  And I fill in "merge_with" with "5"
  And I press "Merge" 
  Then I should be on the admin content page
  When I go to the home page
  Then I should see "Why bears are America's greatest threat."
  When I follow "Why bears are America's greatest threat."
  Then I should see "Bears are unethical"
  And I should see "Bears are bad influences"
  

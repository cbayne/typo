Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge two similar articles

  Background: 
    Given the blog is set up
    And I am logged into the admin panel

    Given the following articles exist:
    |                 title                    |   author        |	body		    | published | id |
    | Why bears are America's greatest threat. | Aaron Miller    | Bears are unethical      | true      | 4  |
    | Bears: Corrupting America's youth.       | Christina Bayne | Bears are bad influences | true      | 5  |

Scenario: Merge two articles.
  Given I am on the edit page for article 4
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "5"
  And I press "Merge" 
  Then I should be on the edit page for article 4
  When I go to the home page 
  Then I should see "Why bears are America's greatest threat."
  And I should not see "Bears: Corrupting America's youth."
  When I go to the edit page for artilce 4
  Then I should see "Bears are unethical"
  And I should see "Bears are bad influences"


  

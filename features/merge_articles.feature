Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge two similar articles

  Background: 
    Given the blog is set up
    And I am logged into the admin panel

    Given the following articles exist:
    |                 title                    |   author        |	body		    | allow_comments| published | id |  type   |
    | Why bears are America's greatest threat. | Aaron Miller    | Bears are unethical      |     true      | t         | 4  | Article |
    | Bears: Corrupting America's youth.       | Christina Bayne | Bears are bad influences |     true      | u         | 5  | Article |

Scenario: Merge two articles.
  Given I am on the edit page for article 4
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "5"
  And I press "Merge" 
  
Scenario: Merged article should contain text of both previous articles
  Given I am on the new article page
  When I follow "All Articles"
  Then I should see "Why bears are America's greatest threat."
  When I follow "Why bears are America's greatest threat."
  Then I should see "Bears are unethical" 
  
  
Scenario: Merged article should have one author
  Given I am on the new article page
  When I follow "All Articles"
  Then I should see "Aaron Miller"
  And I should not see "Christina Bayne"  

Scenario: The title should be either one of the merged articles
  Given I am on the new article page
  When I follow "All Articles"
  Then I should see "Why bears are America's greatest threat."
  And I should not see "Bears: Corrupting America's youth."




 



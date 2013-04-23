Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge two similar articles

  Background: 
    Given the blog is set up
    And I am logged into the admin panel

    Given the following articles exist:
    | id |       author     |                 title                    |   type  |
    | 1  |   Aaron Miller   | Why bears are america's greatest threat. | Article |
    | 2  |  Christina Bayne | Bears: Corrupting america's youth.       | Article | 

Scenario: Merge two articles.
  Given I am on the edit page for article 1
  When I fill in "merge_with" with "2"
  And I press "Merge" 
  

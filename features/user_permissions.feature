Feature: User Permissions
  As a user
  In order to prevent users from merging articles
  I want to limit permissions

Background: 
  Given the blog is set up with a non-admin
  And I am logged into the non-admin panel
  And the following articles exist:
    |                 title                    |   author        |	body		    | published | id | 
    | Why bears are America's greatest threat. | Aaron Miller    | Bears are unethical      | t         | 4  | 
    | Bears: Corrupting America's youth.       | Christina Bayne | Bears are bad influences | u         | 5  | 

  Given I am on the new article page
  When I follow "All Articles"
  Then I should see "Why bears are America's greatest threat." 
  When I follow "Why bears are America's greatest threat."
  Then I should not see "Merge Articles"
  

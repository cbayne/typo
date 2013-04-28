Feature: Merge Articles
    As a blog administrator
    In order to remove duplicated articles
    I want to be able to merge articles with same topic

    Background: articles and users have been added to database

        Given the blog is set up

        Given the following users exist:
            | profile_id | login  | name     |password  | email                 | state  |
            | 2          | user_1 | Aaron    | 1234567  | bears@threatening.com | active |
            | 3          | user_2 | Christie | 1234567  | bears@corrupting.com  | active |

        Given the following articles exist:
            | id | title                                    | author | user_id | body                    | allow_comments | published | published_at        | state     | type    |
            | 3  | Why bears are America's greatest threat. | user_1 | 2       | Bears are unethical      | true           | true      | 2013-25-04 08:30:00 | published | Article |
            | 4  | Bears: Corrupting America's youth.       | user_2 | 3       | Bears are bad influences | true           | true      | 2013-24-04 09:00:00 | published | Article |

        Given the following comments exist:
            | id | type    | author | body     | article_id | user_id | created_at          |
            | 1  | Comment | user_1 | Comment1 | 3          | 2       | 2013-26-04 08:31:00 |
            | 2  | Comment | user_1 | Comment2 | 4          | 2       | 2013-26-04 09:01:00 |

    Scenario: A non-admin cannot merge articles
        Given I am logged in as "user_1" with pass "1234567"
        And I am on the Edit Page of Article with id 3
        Then I should not see "Merge Articles"

    Scenario: An admin can merge articles
        Given I am logged in as "admin" with pass "aaaaaaaa"
        And I am on the Edit Page of Article with id 3
        Then I should see "Merge Articles"
        When I fill in "merge_with" with "4"
        And I press "Merge"
        Then I should be on the admin content page
        And I should see "Articles successfully merged!"

    Scenario: The merged articles should contain the text of both previous articles
        Given the articles with ids "3" and "4" were merged
        And I am on the home page
        Then I should see "Why bears are America's greatest threat."
        When I follow "Why bears are America's greatest threat."
        Then I should see "Bears are unethical"
        And I should see "Bears are bad influences"

Scenario: The merged article should have one author (either one of the originals)
        Given the articles with ids "3" and "4" were merged
        Then "Aaron" should be author of 1 articles
        And "Christie" should be author of 0 articles

    Scenario: Comments on each of the two articles need to all be carried over
        Given the articles with ids "3" and "4" were merged
        And I am on the home page
        Then I should see "Why bears are America's greatest threat."
        When I follow "Why bears are America's greatest threat."
        Then I should see "Comment1"
        And I should see "Comment2"

    Scenario: The title should be either one of the merged articles
        Given the articles with ids "3" and "4" were merged
        And I am on the home page
        Then I should see "Why bears are America's greatest threat."
        And I should not see "Bears: Corrupting America's youth."

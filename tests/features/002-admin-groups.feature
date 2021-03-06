@released
Feature: Admin
  In order to manage groups
  I want to change settings

  Scenario: Create group and connect to existing user
    Given I go to login page
    When I fill in the correct username credentials
    And I click login
    Then I am on the PrimeHub console "Home" page
    When I choose "Admin Portal" in top-right menu
    Then I am on the admin dashboard "Groups" page
    And I should see element with test-id "group"
    When I click element with test-id "add-button"
    Then I should see element with test-id "group/name"
    And I should see element with test-id "group/displayName"
    When I type "e2e-test-group" to element with test-id "group/name"
    And I type "e2e-test-group-display-name" to element with test-id "group/displayName"
    And I type "1" to element with xpath "//div[@data-testid='group/quotaCpu']//input[@class='ant-input-number-input']"
    And I type "1" to element with xpath "//div[@data-testid='group/quotaGpu']//input[@class='ant-input-number-input']"
    And I click element with xpath "//div[@data-testid='group/quotaMemory']//input[@class='ant-checkbox-input']"
    And I type "2" to element with xpath "//div[@data-testid='group/quotaMemory']//input[@class='ant-input-number-input']"
    And I click element with xpath "//div[@data-testid='group/projectQuotaCpu']//input[@class='ant-checkbox-input']"
    And I type "2" to element with xpath "//div[@data-testid='group/projectQuotaCpu']//input[@class='ant-input-number-input']"
    And I click element with xpath "//div[@data-testid='group/projectQuotaGpu']//input[@class='ant-checkbox-input']"
    And I type "2" to element with xpath "//div[@data-testid='group/projectQuotaGpu']//input[@class='ant-input-number-input']"
    And I click element with xpath "//div[@data-testid='group/projectQuotaMemory']//input[@class='ant-checkbox-input']"
    And I type "4" to element with xpath "//div[@data-testid='group/projectQuotaMemory']//input[@class='ant-input-number-input']"
    And I click element with test-id "connect-button"
    And I wait for 4.0 seconds
    And I search my username in name filter
    And I click my username
    And I click element with xpath "//button/span[text()='OK']"
    And I wait for 4.0 seconds
    And I click element with test-id "confirm-button"
    And I wait for 2.0 seconds
    And I search "e2e-test-group" in test-id "text-filter-name"
    Then list-view table "should" contain row with "e2e-test-group"
    When I choose "Logout" in top-right menu
    Then I am on login page

  @normal-user
  Scenario: Enable model deployment and assign group admin
    Given I go to login page
    When I fill in the correct username credentials
    And I click login
    Then I am on the PrimeHub console "Home" page
    When I choose "Admin Portal" in top-right menu
    Then I am on the admin dashboard "Groups" page
    When I search "e2e-test-group" in test-id "text-filter-name"
    And I click edit-button in row contains text "e2e-test-group"
    Then I should see input in test-id "group/name" with value "e2e-test-group"
    When I check boolean input with test-id "group/enabledDeployment"
    # checkbox of group admin
    And I click element with xpath "//table//input"
    And I click element with test-id "confirm-button"
    And I wait for 2.0 seconds
    And I search "e2e-test-group" in test-id "text-filter-name"
    Then list-view table "should" contain row with "e2e-test-group"
    When I click edit-button in row contains text "e2e-test-group"
    Then boolean input with test-id "group/enabledDeployment" should have value "true"
    And I "should" see element with xpath "//table//span[@class='ant-checkbox ant-checkbox-checked']"
    When I choose "Logout" in top-right menu
    Then I am on login page

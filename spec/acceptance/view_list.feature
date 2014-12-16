Feature: Admin user
  Background:
    Admin account exists
  Scenario: Login
    When admin logins
    Then admin could see list of users


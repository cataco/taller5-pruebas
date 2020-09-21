Feature: Login into losestudiantes
    As an user I want to authenticate myself within losestudiantes website in order to rate teachers

Scenario Outline: Login failed with wrong inputs

    Given I go to losestudiantes home screen
    When I open the login screen
    And I fill with <email> and <password>
    And I try to login
    Then I expect to see <result>

    Examples:
      | email            | password | result                    |
      |                  |          | "Ingresa una contraseña"   |
      | miso@gmail.com   |    1234  | "Upss! El correo y" |

      
Scenario Outline: Login successful with valid inputs

    Given I go to losestudiantes home screen
    When I open the login screen
    And I fill with <email> and <password>
    And I try to login
    Then I expect to log in

    Examples:
      | email            |    password  | 
      | test@test.test   |    Un14nd3s  |

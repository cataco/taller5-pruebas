Feature: register into losestudiantes
    As an user I want to authenticate myself within losestudiantes website in order to rate teachers

Scenario Outline: Registatrion failed with wrong inputs

    Given I go to losestudiantes home screen
    When I open the login screen
    And I fill registration with <name>, <last_name>, <terms>, <email> and <password>
    And I try to register
    Then I expect to see <result>

    Examples:
     |terms | name      | last_name      | email            | password   | result                       | result2                   |  result3                                         |         
     |false |           |                |                  |            | "Ingresa tu correo"          |  "Ingresa una contraseña" |"Debes aceptar los términos y condiciones"        |
     |false | test      |                |                  |            | "Ingresa tu correo"          |  "Ingresa una contraseña" |"Debes aceptar los términos y condiciones"        |
     |false | test      |    test        |                  |            | "Ingresa tu correo"          |  "Ingresa una contraseña" |"Debes aceptar los términos y condiciones"        |
     |false | test      |    test        | email            |            | "Ingresa un correo valido"   |  "Ingresa una contraseña" |"Debes aceptar los términos y condiciones"        |
     |false | test      |    test        |                  | Un14nd3s   | "Ingresa tu correo"          |                           |"Debes aceptar los términos y condiciones"        |
     |false |           |                | email            |            | "Ingresa un correo valido"   |  "Ingresa una contraseña" |"Debes aceptar los términos y condiciones"        |
     |false |           |                | email            | Un14nd3s   | "Ingresa un correo valido"   |                           |"Debes aceptar los términos y condiciones"        |


     
Scenario Outline: Registatrion successful

    Given I go to losestudiantes home screen
    When I open the login screen
    And I fill registration with <name>, <last_name>, <terms>, <email> and <password>
    And I try to register
    Then I expect to be registered
    Examples:
     |terms | name      | last_name      | email            | password   |
     |true  | test      |    test        | test@test.test   | Un14nd3s   |

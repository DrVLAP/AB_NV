Feature: Testing scenarios

  Background:
    Given I go to the yandex.ru

  Scenario: Samsung Phone test
    Given I moving to the market in the Электроника, Мобильные телефоны
    When I filter by company: Samsung
    And I filter by price from 40000
    And I remember first item name
    And I open first element page
    Then Name in the description should be the same as remembered

  Scenario: Beats Headset test
    Given I moving to the market in the Электроника, Наушники и Bluetooth-гарнитуры
    When I filter by company: Beats
    And I filter by price from 40000 to 25000
    And I remember first item name
    And I open first element page
    Then Name in the description should be the same as remembered
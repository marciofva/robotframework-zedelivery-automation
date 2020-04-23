*** Settings ***
Documentation       Search flow

Resource            ../resources/commom/hooks.robot
Resource            ../resources/commom/keywords.robot
Resource            ../resources/search_menu/keywords.robot
Resource            ../resources/product/keywords.robot

Suite Setup         Start section
Test Setup          Start test
Suite Teardown      Close section

*** Variables ***
${listOfProducts} = 
...     {
...	            "products": [
...	            {
...			        "name": "Brahma 269ml",
...			        "qtd": 2
...		        },
...		        {
...			        "name": "Soda Antarctica 350ml",
...			        "qtd": 3
...		        },
...		        {
...			        "name": "Torcida Pizza 80g",
...			        "qtd": 5
...		        }
...	        ]
...     }

${categoryProducts} = 
...     {
...	            "filters": [
...                 {
...			            "category_name": "Destilados",
...			            "product": 
...                         {
...					            "name": "Whisky Ballantines 12 anos 1L",
...					             "qtd": 1
...				            }
...		            },
...		            {
...			            "category_name": "Petiscos",
...			            "product": 
...                         {
...				                "name": "Ruffles Cebola e Salsa 96g",
...				                "qtd": 2
...			                }
...		            },
...		            {
...			            "category_name": "Outros",
...			            "product": 
...                         {
...				                "name": "Trident Menta 8g",
...				                "qtd": 9
...			                }
...		            }
...	            ]
...     }


*** Test Cases ***
Add products to a cart through search menu without being logged in
    [tags]  smoke
    Given I add a "${listOfProducts}" to cart through search menu
    When I access the product bag
    Then Should display the purchase amount details
    And Should show the button "ENTRAR PARA CONTINUAR"


Add products to a cart through filter category without being logged in
    [tags]  smoke
    Given I add a "${categoryProducts}" to cart through category
    When I access the product bag
    Then Should display the purchase amount details
    And Should show the button "ENTRAR PARA CONTINUAR"

*** Settings ***
Variables  consts.py
Variables  consts-${environment}.py

Variables  ../PageObjects/locators-common.py
Variables  ../PageObjects/locators-accountPage.py
Variables  ../PageObjects/locators-Order_Now.py
Variables  ../PageObjects/locators-Cart.py

Library  String
Library  Collections
Library  DateTime
Library  Browser  # auto_closing_level=MANUAL
Library  OperatingSystem

Resource  CommonKeywords.resource
Resource  LoginKeywords.resource
Resource  HomePageKeywords.resource
Resource  OrderNowKeywords.resource
Resource  CartKeywords.resource




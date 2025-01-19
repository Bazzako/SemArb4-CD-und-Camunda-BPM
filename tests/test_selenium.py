from selenium import webdriver
import pytest

def test_selenium():
    driver = webdriver.Chrome
    driver.get("http://10.0.24.60:30000/camunda/app/welcome/default/#!/login")
# Robotframework 
---

E2E testing project with Robotframework


### Getting started

How to install Robot Framework on Mac OS:


- Install python 3

Download python 3 [Click here](https://www.python.org/downloads/)

To verify the successful installation of python 3, Run below command

```console
$ python3 --version
```


- Install Robot Framework

```console
$ pip3 install robotframework
```


- Install Selenium library

```console
$ pip3 install robotframework-Selenium2Library
```


- Install browser drivers

```console
$ brew cask install chromedriver
```


### Supported browsers

- CHROME


### Test cases

- Search for products through menu bar
- Search for products through different categories


### Running the tests

- Run all tests

```console
$ robot -d ./logs tests/
```


- Run the search test

```console
$ robot -d ./logs tests/search_products.robot
```


- Run tests by tag

```console
$ robot -d ./logs -i smoke tests/search_products.robot
```


### Open report

```console
$ open logs/report.html
```
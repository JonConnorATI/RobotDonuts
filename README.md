# Donuts - Robot Framework

This is a Robot framework that I've created to help anyone interested in UI Automation testing.

## Why this website?

I chose this website as it has some good features to practice on. Also, it is a bit temperamental when switching between pages so the tests have to be robust and able to handle behaviour that may or may not happen. All good fun.

## What is Robot Framework?

If you don't know anything about the Robot Framework, by all means have a look in this repository, clone it and have a play around. If you would like some learning resources, this free course on [Udemy](https://www.udemy.com/course/robot-framework-crash-course-2021-edition/) is very good. If you'd like to know more about Robot Framework please check out the [Robot Framework Org](https://robotframework.org/). 

## Compare with other Frameworks

There's also other projects I created with the same tests. One using TestNG and the other Cucumber. [Donuts - TestNG](https://github.com/JonConnorATI/donutsPageObjectModel) and [Donuts - Cucumber](https://github.com/JonConnorATI/Donuts). You can see how the different tools work compared to each other.

## How do you use it?

I found the Robot Framework a bit strange to work with at first and was a bit worried about having to use python as I've only ever used Java in my automation projects. However, there's very little python knowledge needed and the Robot framework syntax is very straight forward, and like python is mainly based on spaces between functions and variables. Goodbye, semicolons. Curly braces are still with us, but not used the same way.

### How much experience do I need?
For somebody in Testing, who is looking to get into Automation I would definitely recommend using Robot framework. It comes pre-packaged with the playwright [browser](https://marketsquare.github.io/robotframework-browser/Browser.html) library and [built-in](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html) library. Basically you use the keywords in these libraries to make your own methods that make up your test.

### Keywords

Robot framework is keyword driven which means plain english phrases trigger commands in the framework.

The library keywords are straight forward and once you find one that you need, declare it and add the arguments that it requires. It tells you in the library and the IDE what you need.

A simple example, I want to get the text from a Title on webpage, and confirm it is what I expected. 

#### Look through libraries and select a keyword

* There is a keyword called [Get Text](https://marketsquare.github.io/robotframework-browser/Browser.html#Get%20Text) 

* looking up the documentation It needs a selector, and will take other Arguments, assertion_operator, assertion_expected and message

so as a minimum I need to declare:

    Get Text    //div[@class='main']//h1`

But this isn't much help. We'll get the text but what do we do with it? We need to assign the value to a variable, to carry out an assertion or assert a known value directly. So we could do:

    Get Text    //div[@class='main']//h1  ==  The title we expect`

#### Making our own keywords

We can turn this into a keyword that we can use anywhere in our tests by declaring it and then calling it again in a test. Don't worry, the Keywords we create go in one file and tests are written in another file. To call a keyword we just type it in the test and give it any arguments it requires

Here's a keyword file snippet of what we've just done above. We'll write the keyword as "Get the text and verify it is the expected text"

    *** Keywords ***

    Get the text and verify it is the expected text 
        [Arguments]  ${locator}  ${expected}
        Get Text    ${locator}  ==  ${expected}
Now here's a test file snippet to show how we use this keyword we created

    *** Test Cases ***

    Get the text and verify it is the expected text     //div[@class='main']//h1        The title we expect
We can use this keyword over and over just by typing the exact phrase and passing it the two arguments, locator and expected text.

Once you can get your head round this you'll be flying :airplane:

## What do I need?

## Clone the repository

## How do I run the tests

Run the tests from the Terminal Tab in PyCharm. You should be located in the Folder containing the Framework. Then type in robot --argumentfile .\ArgumentFiles\runnerJon.robot 

## What Next

I hope this has been helpful, and you've successfully installed and ran the tests. You can now point this framework at any website and automate tests by writing your own test cases and keywords.

If you get stuck there's unlimited resources to tap into on the web. A big part of becoming an automation test engineer is finding out how to do things yourself. I come across automation scenarios every day when I don't know what to do to overcome an issue, so I just type `Robot Framework ....my issue...` into a Google search, there's usually hundreds of others who've had the same problem.

There are many libraries available to Robot Framework, some of them allow you to interact with desktop applications for example. Remember you are not limited to web applications.

:bulb: Top tip

If you are trying to fix something, keep your original code by commenting it out, and writing your new solution directly underneath, don't delete the original code. You might need to go back to it. The number of times I've deleted something then ended up having to write it all again .... save yourself some pain.

Good luck and happy testing !!!!!!<br><br><br>


        



    
        





Airport Challenge
=================

A programme that allows an Air Traffic Controller to manage the take off and landing of planes at multiple airports. This is a recent project, completed in my journey to get back in to coding.

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

Getting Started
---------
* Fork this repo
* Clone to your local machine git clone git@github.com:CharlyMannion/airport_challenge.git
* Run the command gem install bundle (if you don't have bundle already)
* When the installation completes, run bundle
* Run the command gem install bundle (if you don't have bundle already)
* When the installation completes, run bundle

Running Tests
---------
`rspec`


How I approached this challenge
---------
* I followed a TDD approach to this challenge.
* My first step was to write a feature tests, and watch them fail. I would then use the feature test to help me write a unit test, and watch it fail. I would read the error messages the unit test generated to help me write the code I wanted.
* I followed the Single Responsibility principle, and created separate classes and test suites for AirTrafficController, Plane, Airport and Weather
* I used the .sample method to randomly set the weather
* I used mocks in my tests to override the random weather to ensure consistent test behaviour
* I ran rubocop regularly to help me improve my code.
* I wrote code to defend against edge cases, such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc
* I achieved 100% Test coverage
* When I was happy with the program at a particular point, I attempted to refactor to follow principles such as DRY.

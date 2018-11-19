![ruby 2.5.1](https://img.shields.io/badge/ruby-2.5.1-red.svg)
![rails_ 5.2.1](https://img.shields.io/badge/rails_-5.2.1-blue.svg)

# Trelora Consult App
Module 3 | Dates: 2018.10.22 - 2018.11.02 | Contributors: Abdulla Qudrat, Autumn Martin, Claire Beauvais, & Rajaa Boulassouak

![](https://user-images.githubusercontent.com/36902512/48691384-a1ab2a00-eb8f-11e8-9531-3ed4ffc33e1e.png)

## About
### Intro
Trelora Consult App is a four person group project built over 11 days. The goal of this project is to build a mobile web application for a listing consultation tool based on Trelora's specifications. Trelora is a flat-fee real estate brokerage in Denver, CO. This app is deployed on Heroku, and can be visited here: https://trelora-consult-app.herokuapp.com/.

#### Tech Stack
Ruby, Rails, Heroku, CircleCI, HTML, CSS, Bootstrap, JQuery, JavaScript, Webpack, JSON, Net::HTTP, XML, Nokogiri, RSpec, Capybara, Shoulda Matchers, SimpleCov, Git, GitHub, GitHub project management

### Background
This app would serve home agents during pricing appointments with listing clients. It provides the tools for a home agent to prepare for an appointment with notes, links (including client contact information and the home's listing on Zillow), and a map of the home location with a link for directions. 

It also provides the tools for a home agent to take notes during the appointment, save these notes throughout, and submit them at the end. 

Lastly, it includes a timer that begins when a user clicks on "Begin Visit" and ends when the user clicks on "Save and Finish." This application is designed to be responsive, but the primary expectation was to view the app on an iPhone 8. 

![](https://user-images.githubusercontent.com/36902512/48687393-60f6e500-eb7e-11e8-8ffb-f960324c0238.gif)

## App Walkthrough
First, a home agent signs in:

![](https://user-images.githubusercontent.com/36902512/48691847-49752780-eb91-11e8-9a28-983eacce3096.png)

Next, an agent selects an address from assigned addresses or enters in an address. 

![](https://user-images.githubusercontent.com/36902512/48691891-6d386d80-eb91-11e8-81bd-7d1c312b5d95.png)

This takes the agent to a page that displays client & property details for preparation.

![](https://user-images.githubusercontent.com/36902512/48691563-36ae2300-eb90-11e8-95bb-dc95852ce909.png)

![](https://user-images.githubusercontent.com/36902512/48691574-3b72d700-eb90-11e8-84b8-0717bfc865fa.png)

When the agent clicks on "Begin Visit" on this screen, a timer will start and he/she will be directed to screen to take notes. On this screen, the agent can continually enter and save info.

![](https://user-images.githubusercontent.com/36902512/48691440-cf906e80-eb8f-11e8-9e27-56561bba4bf1.png)

![](https://user-images.githubusercontent.com/36902512/48691743-e4213680-eb90-11e8-95ca-47bbabf43f08.png)

When all fields are complete and the agent is ready, clicking on "Save and Finish" stops the timer and displays the submitted info.

![](https://user-images.githubusercontent.com/36902512/48691623-7248ed00-eb90-11e8-9a3e-b2c6381647ef.png)

Clicking on logout returns the user to the login screen. 

![](https://user-images.githubusercontent.com/36902512/48691835-411cec80-eb91-11e8-9998-9a47e6ccade2.png)

## Getting Started
Clone this repository via `git clone https://github.com/Autumn-Martin/trelora_consult_app` in the CLI.

This project uses [Ruby on Rails](http://installrails.com/) framework version 5.2.1, and ![Ruby](https://www.ruby-lang.org/en/documentation/installation/) version 2.5.1. [Bundler](http://bundler.io/) is used to install the gems needed for the application. 

Running this application in the development environment requires multiple private API keys. If you have access to these, perform the following in the CLI: 
```
bundle
rails s
```

## Testing
[Rspec-Rails](https://github.com/rspec/rspec-rails) is used for testing. Perfom the following on the CLI to run the test suite: `rspec` or `bundle exec rspec` if required.

## Additional Info
System Dependencies:
 - Ruby Version 2.5.1
 - Rails 5.2.1

Example Gems:
 - Rails-RSpec for tests (test) 
https://github.com/rspec/rspec-rails
 - Bootstrap (styling) 
https://getbootstrap.com
 - Pry (test) 
 https://github.com/pry/pry
 - Figaro (development/test) 
 https://github.com/laserlemon/figaro
 - Capybara (test) 
 https://github.com/teamcapybara/capybara
 - SimpleCov (test) 
 https://github.com/colszowka/simplecov
 - JQuery Rails (all) 
 https://github.com/rails/jquery-rails

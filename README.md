# README

## Introduction

Application Description

## Requirements

This code has been run and tested using the following internal and external components

Environment
•  Docker Engine 4.26.1
•  Heroku
•  Windows 11

Program
•  Ruby 3.1.2
•  Rails 7.0.8
•  Rspec-rails
•  PostgreSQL 14

Tools
•  Git Hub - https://github.com/CSCE431-Software-Engineering/sprint-1-amcp
•  RuboCop 1.22.1
•  Simplecov 0.22.0
•  Brakeman 6.1.2
•  Jira
•  Bootstrap 6.0.2
•  ChatGPT


## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Documentation

Our product and sprint backlog can be found in Jira, with organization name AMCP and project name AMCP

Deployment and Support Plan:
https://docs.google.com/document/d/14b5p3hwyu_XfHtBzg0qPkXsy7hg2RXptHGoSM6dN-r8/edit#heading=h.m6nexonknx11

Document
Documents below can be found in our project notebook: https://docs.google.com/document/d/1qrQ7y0FA8FSLbUN_ZcIY03LVjbNr7efH/edit
•  Data Design 
•  UX Design 
•  User’s Manual: Meeting in _AMCP_-20240407_155623-Meeting Recording.mp4 (sharepoint.com)
•  Others

Data
•  Test Data v?
•  Others


## Installation

Download this code repository by using git:

`git clone https://github.com/CSCE431-Software-Engineering/sprint-1-amcp`


## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd sprint-1-amcp`

`docker run -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/csce431:latest`

For windows replace (pwd) with {PWD}, see below:
`docker run -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/csce431:latest`


Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files

We have environment variables setup for Authentication. The tutorial can be found here: https://docs.google.com/document/d/14b5p3hwyu_XfHtBzg0qPkXsy7hg2RXptHGoSM6dN-r8/edit?usp=sharing
Navigate to the “installation” section of the tutorial


## Deployment
See the video below as the guide for installing and deploying the application:

https://tamucs.sharepoint.com/teams/Team-Team-SP24-CSCE431-SoftwareEngineering-AMCP/_layouts/15/stream.aspx?id=%2Fteams%2FTeam%2DTeam%2DSP24%2DCSCE431%2DSoftwareEngineering%2DAMCP%2FShared%20Documents%2FRecordings%2FMeeting%20in%20%5FAMCP%5F%2D20240401%5F195335%2DMeeting%20Recording%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview

## CI/CD

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/CSCE431-Software-Engineering/sprint-1-amcp/actions

## Support
General Guide for the application can be found in the document below:
https://docs.google.com/document/d/14b5p3hwyu_XfHtBzg0qPkXsy7hg2RXptHGoSM6dN-r8/edit

## Extra Help

Please contact Pauline Wade paulinewade@tamu.edu for any questions on the app.


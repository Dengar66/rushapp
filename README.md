# rushapp
UW Greek Rush App for CS506 Fall 2015


Backend Heroku Server Link: https://hidden-stream-3045.herokuapp.com

Backend Code Link: https://ide.c9.io/ainstefjord/greek_rush
The above link to cloud9 is where our development is taking place; An account will nbe needed to 
view the cloud9 code, but it is publicly viewable via the link. An account can be created by using Github
credentials.

Backend Notes: 

What's done so far:
*** iteration 1 *** (skip to iteration 2)
1. added a few recommended gems: Bootstrap Generator  devise  email_validator
2. changed the landing page to the admin page
3. added models of Fraternity and Event detailed below
4. added links to Fraternity and Event pages from the landing
    a. cannot destroy from links, only add and edit
    b.Use “rails console” commands to create/edit/destroy
5. responds to JSON, just concat .json to any calls to models 
6. require that all required fields are input
    a. we can discuss what is required
*** iteration 2 ***
7. we added code coverage testing; in cloud 9 console type :rake  test and view index.htnl in coverage folder
8. SimpleCov is being implemented as a more flexible way to test code coverage, we anticipate SimpleCov to be used in conjunction with rspec
9. User models have been created for testing on frontend aided with divise gem  Users are now required to log in to do  anything more than read the models
10. 

Heroku is for stable builds and c9 is for dev builds. The iteration 2 build has a known bug when deployd to heroku; it's missing HTTP request as they come in (errors say the app is empty). Cloud9 version is fully functional;. The details we have about the heroku bug are as follows: heroku is set tup  to  pull directly from the github repo which
was pushed from cloud9 (where the working version resides):;


Instructions for Using and Testing Frontend iOS Application:
Requirements
Apple Computer
Xcode
Developer Tools (specifically Instruments)
Processing Power to run iPhone 6 emulator
Instructions
Pull project from the Github Repository, Iteration 2 branch
Open Xcode, and open the project
Select rushapp as the project and iPhone 6 as the device
Build the project for running
Begin to run the emulator
Feel free to play around with the app in the emulator
Click the Xcode menu bar, then select Developer Tools, and open Instruments
Choose profiling template as Automation
Click the display settings button in the window to the right of the script
Add script, click import, and select the It2ScriptV1.js JavaScript file
Stop the running of the application from Xcode
Click the play button at the bottom of the script and watch how the app behaves
Shows a testing of all the user view options



Goals 

1. Learn how to use the db cleaner described below in the note
2. Might need to add migration of event:references to Fraternity
    a. right now an Event belongs_to a Fraternity but no relation the other way 
    b.Will research into the effects of this
3. Put in bounds for the inputs 
    a. for location this might require some work, might even need to change location from string to latitude:decimal and longitude:decimal
4. Login authentication and add User model object
    a. need more info on exactly Users are going to work
    b. As of now I will make 1 User
    c. this means no additional precautions for CRUD operations since there will only be 1 account
    d. simple token system
5. Make it pretty 
    a. This is where I really need help, not great at the design part
6. Test a bunch with the gems we found earlier
7. Security
    a. SQL injection is likely dealt with by the framework
    b. Storing cookies on server using ActiveRecordStore
8. Deploy to heroku 
    a. c9.io doesn’t give much memory
9. Possibly make it so that only requests coming from the iOS app work
    a. This will help prevent excessive traffic since we are limited by Heroku’s memory and CPU restrictions
10. Be done and help with iOS


URL: https://greek-rush-ainstefjord.c9.io/ 
Models: URL right now is my workspace
access:  URL/’model’
new: URL/’model’/new
show model: URL/’model’/’id’
edit model: URL/’model’/’id’/edit
JSON: URL/’model’/’id’.json
All JSON: URL/'model'.json


Fraternity:
name:string (required) 
location:string 
history:string
email:string // 1 to 1 pairing with position(s) below 
semi colon delimited?
position:string  //position name pair e.g. VP of Recruitment: John Smith
can have multiple 
semi colon delimited?
Event:
name:string (required)
date:datetime (required)
location:string (required)
fraternity:references (required)
description:string 

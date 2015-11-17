# rushapp
UW Greek Rush App for CS506 Fall 2015

Frontend: Running the JS file for UI Automation:
This JavaScript should be imported into the Automation tool found within the Instruments tool in Developer Tools.
After that, click the play button while Xcode is running with the target emulator and project.

Backend Server Link: https://greek-rush-ainstefjord.c9.io/ 

Backend Code Link: https://ide.c9.io/ainstefjord/greek_rush


Backend Notes: 

What I’ve done so far:

1. added a few recommended gems: Bootstrap Generator  devise  email_validator
2. changed the landing page to the admin page
3. added models of Fraternity and Event detailed below
4. added links to Fraternity and Event pages from the landing
    a. cannot destroy from links, only add and edit
    b.Use “rails console” commands to create/edit/destroy
5. responds to JSON, just concat .json to any calls to models 
6. require that all required fields are input
    a. we can discuss what is required 



**Note** Rails convention has groups of model objects plural and object definitions singular. This means the URL for fraternity is https://greek-rush-ainstefjord.c9.io/fraternities
Yes, it knows the “change the y to i add es” rule. Yes, this does mean the machines are coming for us.

**Note** During testing realized that ID numbers are not reused. At 2 now, looking into cleaning strategies to start from 1. Found gem here that will let us clean the db and basically reset it when we are putting in real information. I did not install this gem and it is not in the gemfile either, wanted to wait and talk it out with you guys. 

**Note** When making an event, you need to specify the ID number of the fraternity, not the name. Right now there is 1 fraternity named Test2 with id 2. I’ll try to fix this. 


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

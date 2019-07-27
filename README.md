# _Word Definer_

#### _An independent project for the coding school, Epicodus, written on July 26, 2019._

#### By _**Daniel Hongel**_

## Description

_This application is an independent coding project from a Ruby coding class at Epicodus. This application is intended to demonstrate an understanding of Ruby and basic routing, using Sinatra. This program will be a website for kids to create there own dictionary of words. They will be able to add and/or remove words and definitions. To see a live version of the program on Heroku, please click this link: https://still-bayou-70188.herokuapp.com/_

## Setup/Installation Requirements

* _Clone this repository_
* _Open terminal and type 'git clone [git link]'_
* _Navigate to project directory using cd in terminal_
* _Open project in text editor (atom .)_
* _Type 'bundle install' in terminal to load Gems_
* _To run tests, type 'rspec' in terminal_
* _To run the program, type ruby app.rb in terminal_

## Specs
| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
|creates a new word object with an entered name and a unique id| 'bubblefy' | bubblefy, id: 1|
|returns an empty array where future words will be stored|Word.all|[ ]|
|stores word objects in a hash to mock a database, then can return them in an array|New words entered: 'bubblefy', 'uncyorn', 'flutterby'| ['bubblefy', 'uncyorn', 'flutterby']|
|identifies two Word objects as the same if there attributes match| word1 = Word.new('bubblefy', nil) word2 = Word.new('bubblefy', nil) | true |
|deletes a word object by id|word1.delete|[word2, word3] (word1 now removed)|
|sorts words alphabetically by name|'bubblefy', 'uncyorn', 'flutterby'|'bubblefy', 'flutterby', 'uncyorn'|
|creates a definition object and stores it with the parent word|'makes bubbles out of anything'|bubblefy|
|finds the definition by word id|1|'makes bubbles out of anything'|


## Known Bugs

_No known bugs_

## Support and contact details

_Please contact me if you encounter issues with this program, have suggestions, or would like to contribute to this or future projects. I can be reached at:  fatherofdharma@gmail.com._

## Technologies Used

* Ruby
* RubyGems
* Atom
* GitHub
* Heroku

### License
_This software is licensed under MIT license._

Copyright (c) 2019 **_Daniel Hongel_**

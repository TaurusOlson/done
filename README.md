# DESCRIPTION

done.rb is a script allowing you to track what you've done in a simple way.


# MOTIVATION

Todolists are great but most of the time they only tell you what you have todo
ant not what you've done so far. I wanted a tool that I could use in a terminal
(my terminal is a kind of second home) with a single line and that would store
the things I do everyday in a readable format (YAML). One more requirement is the use
of tags in order to bring a bit of organization in all those messy notes.


# FEATURES
    
* a single command line
* notes store in YAML format
* simple organzation with tags


# INSTALLATION

* Clone the repository
* Make done.rb executable 
* Add it to your $PATH or copy it to directory included in the $PATH


# CONFIGURATION

* Change the path to the file where your notes are stored. 
* You can create an alias for a faster use.
    
            alias d='path/to/done.rb'


# USAGE

* Add a note

            d 'Paid the rent'

* Add notes with tags

            d 'Installed rvm' install rvm ruby 
            d 'Read a tutorial about DSL in Ruby' tuto ruby 

* Display your notes
    
            d

            - [11/2/11] Paid the rent ||
            - [11/2/11] Installed rvm |install, ruby|
            - [11/2/11] Read a tutorial about DSL in Ruby |tuto, ruby|


* Search for notes with a specific tag
    
            d ruby

            - [11/2/11] Installed rvm |install, rvm, ruby|
            - [11/2/11] Read a tutorial about DSL in Ruby |tuto, ruby|

            d tuto

            - [11/2/11] Read a tutorial about DSL in Ruby |tuto, ruby|



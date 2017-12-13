##User stories

As a makers student <br/>
So that I have an overview of all my saved links <br/>
I want see a list of links <br/>

As a makers student <br/>
So that I can update my list of links <br/>
I'd like to add new links <br/>

As a makers student <br/>
So that I can quickly find links <br/>
I'd like to see them in chronological order <br/>

As a makers student <br/>
So that I can efficiently save links <br/>
I'd like to add the site's address and title to my bookmark manager <br/>

As a makers student <br/>
So that I can organize links <br/>
I'd like to be able to add tags <br/>

As a makers student <br/>
So that I can easily find links <br/>
I'd like to filter links by tags <br/>

## Setup

In order to use this program you will need to create a database called bookmark_manager_development and bookmark_manager_test. There is no rake task that will do this for you. Start by running bundle. The ruby version used for this program is Ruby 2.4.0. Running rackup will start the server.

## How it works

A very simple ruby program that bookmarks urls. You have the option of entering a url, a title and whatever tags you want the url to be associated with. The data will be persisted into your database. In the url you can find bookmarks based on tags.

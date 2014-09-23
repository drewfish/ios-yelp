# Yelp Client

This is an iOS demo application for displaying business info from http://yelp.com/.

**Time spent:** 15 hours


## Completed User Stories

* Search results page
    * [x] Table rows should be dynamic height according to the content height
    * [x] Custom cells should have the proper Auto Layout constraints
    * [x] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
    * [ ] Optional: infinite scroll for restaurant results
    * [ ] Optional: Implement map view of restaurant results
* Filter page. Unfortunately, not all the filters are supported in the Yelp API.
    * [x] The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
    * [x] The filters table should be organized into sections as in the mock.
    * [x] You can use the default UISwitch for on/off states.
    * [ ] Optional: implement a custom switch
    * [x] Radius filter should expand as in the real Yelp app
    * [x] Categories should show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
    * [x] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
* [ ] Optional: Implement the restaurant detail page.


## Notes

* added a "search" button on search results page to rerun the search (user might have changed locations, so results might be different)
* the "search" button on the filters page initiates the search, so that search loads while we're segueing
* both the "distance" and "sort by" expand/collapse filter sections are handle by the same code


## Walkthrough of All User Stories

![Video Walkthrough](hw.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).



# Bridges
Demo App for the Sac Mobile Meetup's "Beginning Mobile App Development" series.

![](https://github.com/djibouti33/bridges/blob/master/screenshot.png)

This repo contains the master branch + 3 branches. 

## Master
Contains an empty starter project

## Step1
This branch contains all our bridge data (plist and images), and we create a Bridge model to store individual bridge objects.

## Step2
This branch contains all the code necessary to show the Bridge Index screen. We add a custom UIViewController subclass, add a UITableView, and add a custom Prototype UITableViewCell.

## Step3
This branch contains all the code necessary to transition from the Bridge Index screen to the Bridge Detail screen. We wrap our custom UIViewController subclass in a UINavigationController and push the detail controller when the user taps a table row.

## Step4
This branch contains all the code necessary to wrap our app in a UITabBarController, display a mapView with annotations, and send a user to the Bridge Detail View Controller upon tapping on a callout accessory view.

# Parstagram Notes

* Parse Setup and Authentication video uses old version of XCode.

* The **CocoaPods** guide has a lot of technical information that is not necessary for students at this level. This should probably be reduced to something like - "A CocoaPod is a package of code written by somebody else that we can download and use in our project." Or possibly even, "We need to grab some code off the internet (called a CocoaPod) which will help us connect to our Parse server."

* Another issue with the CocoaPods guide is it has Alamofire and OAuthSwift packages listed, but not Parse.

* **Building Data driven Apps with Parse** guide needs updating.
    * Error instead of NSError
    * PFFile is now PFFileObject
    * Update Swift syntax
    * Too much technical detail

### Possible watered-down version of CocoaPods guide:

# CocoaPods
## Overview
A CocoaPod is a package of code downloaded from the internet which we can use in our project.

## Installing CocoaPods
Open a terminal on your machine and type in the following command:
```
sudo gem install -n /usr/local/bin cocoapods     # Install CocoaPods gem
pod setup                                        # Clones the CocoaPods specs repo to ~/.cocoapods
```
## Adding a Pod To Your Project
### Create a new XCode Project

### Create the Podfile
The Podfile is a plain text file where you can add multiple pods. You only need a single Podfile per project. 

* From a terminal in the root directory of your project, run...
```
pod init
```
You should now see a file named Podfile in your root directory.

Open the file in XCode. It will look like this:
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Parstagram' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Parstagram

end
```

Add "pod 'Parse'" under the line
```
# Pods for Parstagram
```
Your Podfile should now look like this:
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Parstagram' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Parstagram
  pod 'Parse'

end
```
Save and close the file.

Now back in your terminal type:
```
pod install
```
Now open the XCode Workspace file.


## Concepts Covered in Parstagram Project
* CocoaPod
    * Installation
    * Usage
        * import Parse

* Setting up an app on Heroku
    * What Heroku is used for
* Creating a new UIViewController class
    * Associating the new UIViewController class with a view controller in the storyboard.
    * What is an "initial view controller"
* Parse
    * What is Parse
    * Connecting to the Parse server from the iOS app (in the app delegate)
* UITextField
    * Outlets
    * Getting text from
* UIButton
    * Actions
* MongoDB
    * What is a database
    * User table
* App Transport Security
* Parse User creation and login
    * ~~signUpInBackgroundWithBlock~~
    * ~~success block~~
    * Error
        * Error codes
        * Error handling
        * Casting from Error to NSError (Swift 4)
        * Showing an alert
    * Data Persistence
        * Caching a user
* Logout
    * Need to update code snippet to use Error instead of NSError.
* Segue
    * From view controller instead of from button
    * Modal display
    * Segue identifier
    * Perform segue
* Storyboard identifier for a UIViewController
* Take A Photo
    * Info.plist file
        * Opening as XML
        * Should probably just tell students to add text instead of editing the property list.
    * Implementing a Protocol    
    
* Tap Gesture Recognizer
    * On UIImageView
        * User interaction enabled = true
* View the last 20 posts
    * Table view
    * Custom table view cell
    * Fetching data
* Tabbed View Controller (optional)



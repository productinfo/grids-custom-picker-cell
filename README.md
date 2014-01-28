ShinobiGrids for iOS: Custom Picker Cell (Objective-C)
=====================

This project demonstrates how to add a custom editable cell to your ShinobiDataGrid. There's an accompanying blog post [here](http://www.shinobicontrols.com/blog/posts/2014/01/28/building-your-own-editable-data-grid-cells).

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiGrids for iOS. (You'll need version 2.5.3 or greater for it to work as intended - if you don't have that version see below for a workaround.) If you don't have it yet, you can download a free trial from the [ShinobiGrids website](http://www.shinobicontrols.com/ios/shinobigrids/).

If you've used the installer to install ShinobiGrids, the project should just work. If you haven't, then once you've downloaded and unzipped ShinobiGrids, open up the project in Xcode, and drag ShinobiGrids.framework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your license key. To do so, open up ViewController.m and edit the following line:

    _shinobiDataGrid.licenseKey = @""; // TODO: add your trial licence key here!
    
To get the code to work in versions before 2.5.3, you'll need to add the following method to PickerCell.m:

    - (void) actUponEditEvent {
        [self respondToEditEvent];
    }

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.


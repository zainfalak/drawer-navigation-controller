### Create side drawers with absolutely no code change required! ###

Most drawer, aka side menu, implementations I've seen are monstrous with unnecessary complication and piles of code (that will sure make integration of these framework very difficult and a maintenance a nightmare).  My implementation is so simple you do not have to change any of your existing code or extend any class. A simple drawer category to UINavigationController turns any navigation controller to a controller that is able to show drawers (from left, right, anchored or fullscreen).

Take a look at [this video](http://www.youtube.com/watch?v=5T-1-_pFbG0) to see how this looks.

<a href='http://www.youtube.com/watch?feature=player_embedded&v=5T-1-_pFbG0' target='_blank'><img src='http://img.youtube.com/vi/5T-1-_pFbG0/0.jpg' width='425' height=344 /></a>

## How to Install ##
Get a copy of the source [here](http://code.google.com/p/drawer-navigation-controller/source/checkout). You need just the GZDrawer category (`UINavigationController+GZDrawer.h` and `UINavigationController+GZDrawer.m`), nothing else! Copy those files to your project (for example, drag-drop the files in Xcode).

Next, import the header file `UINavigationController+GZDrawer.h` to whichever navigation controller you would like to show the drawer on.

Create whatever view controller you want to show in the drawer (say a tableviewcontroller with your nice menu items), and push that view controller on your navigation's stack using the method the selector `@selector(pushDrawerViewController:withStyle:animated:)` like:

```

    [navigationController pushDrawerViewController:drawerMenu withStyle:DrawerLayoutStyleLeftAnchored animated:YES];

```


It's that easy!

Yes, this works in iOS 6 as well as iOS 3.0!

There is plenty more you can do. Take a look at the header file for more.

## Disclaimer ##

You may use, modify, etc. this code. However, give credit per the license agreement.
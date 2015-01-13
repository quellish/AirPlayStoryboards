###Airplay storyboards

Demonstration of using external displays (Airplay, etc.) with storyboards.

Every screen has a window, and every window has a root view controller. When a storyboard is loaded, any view controller that is set to be the initial view controller will become the root view controller for the main (device) screen. All other screens are not managed directly by the storyboard.

This example uses an informal protocol on UIApplication to extend UIApplicationDelegate to make it easy to support external displays. When external displays become available the delegate is notified through callbacks. At that point the application can decide what windows should attach to what screens.

[http://quellish.tumblr.com](http://quellish.tumblr.com)
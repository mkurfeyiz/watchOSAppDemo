# watchOSAppDemo

A demo Apple Watch application based on other mobile banking watch apps. 

This application includes;

* InterfaceController designs on storyboard using WatchKit components like Groups, Tables etc.
* Tables to display list of dummy values
* CoreLocation implementation to get the current location of the device
* Basic communication between watchOS and iOS applications
* HTTP request can be made in the future. (watchOS allows HTTP requests)

#### P.S : 

Project also contains a custom architecture made by me which I call it 'KURFO Architecture'. This custom architectures name comes from a nickname among my friends :)

Initials stands for;
* K -> Kontroller : Contains controller classes. Yeah, I know it should have been 'Controller' but I had to adapt it to my own way. Plus it reminds me of Mortal Kombat :)
* U -> Utilities : This is for operations (usually backend operations) and for structures (doesnt have to be actual struct type) helps out the application in different ways. It can contain things like Singleton or any other patterns, Network Operations, Enumerations etc.
* R -> Resources : This layer works in the exact same way like it works in the other architectures.
* F -> Features : We can use this layer for our extensions and custom components that we make.
* O -> Objects : It simply contains model classes.

I'm not an expert at the moment but this custom architecture could be modified later and maybe, all developers can use this some day :)  

Cheers!

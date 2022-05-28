# ocado_challenge

This project is part of Ocado's challenge and it consists in a simple app made using SwiftUI and [Combine](https://developer.apple.com/documentation/combine) to retrive a list of products from JSON API.

The App is made using MVVM architecture and its UI is build with SwiftUI. The retrieval of products images are made using Apple's Combine asynchronous API.

Taking advantage of async requests, I made a middle View using SwiftUI `ProgressView` to indicate user that info is loading. It can be tested using `Network Link Conditioner` App from [Xcode Additional Tools](https://developer.apple.com/download/all/?q=additional%20tools%20for%20xcode%2012) to simulate slow network.

![Link Network Conditioner screen](https://useyourloaf.com/blog/network-link-conditioner/002.png)


This app is very simple but contains a few tests. To test a MVVM architecture, I use a Repo pattern to provide an abstraction of data and be able to mock up the fake local data for testing JSON decodification into App's models.

Source files are grouped into screens/feature related, due this app has 2 screen types, there are `ProductList` and `ProductDetail` folders with its `Model`, `ViewModel` and `View` swift files.


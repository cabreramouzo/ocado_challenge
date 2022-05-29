# ocado_challenge

This project is part of [Ocado's challenge](https://github.com/ocadotechnology/mobile-challenge) and it consists of a simple app made using SwiftUI and [Combine](https://developer.apple.com/documentation/combine) to retrieve a list of products from JSON API.

The App is made using MVVM architecture and its UI is built with SwiftUI. The retrieval of product images is made using Apple's Combine asynchronous API.

Taking advantage of async requests, I made a middle View using SwiftUI  `ProgressView` to indicate to the user the info is loading. It can be tested  `Network Link Conditioner` App from [Xcode Additional Tools](https://developer.apple.com/download/all/?q=additional%20tools%20for%20xcode%2012) to simulate a slow network.

![Link Network Conditioner screen](https://useyourloaf.com/blog/network-link-conditioner/002.png)


This app is very simple but contains a few tests. To test an MVVM architecture, I use a Repo pattern to provide an abstraction of data using [Swift Genereics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) and be able to mock up a fake local data for testing JSON decodification into App's models.

Source files are grouped into screens/feature related, due this app has 2 screen types, there are `ProductList` and `ProductDetail` folders with its `Model`, `ViewModel` and `View` swift files.

# TODO
- [ ] UI tests
- [ ] Simplify SwiftUI Previews

//
//  ocado_challengeApp.swift
//  ocado_challenge
//
//  Created by MAC on 25/05/2022.
//

import SwiftUI

@main
struct ocado_challengeApp: App {
    @StateObject var productsVM = ProductListViewModel()
    var body: some Scene {
        WindowGroup {
            productListView().environmentObject(productsVM)
        }
    }
}

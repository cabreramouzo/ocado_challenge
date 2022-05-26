//
//  ContentView.swift
//  ocado_challenge
//
//  Created by MAC on 25/05/2022.
//

import SwiftUI

struct productListView: View {
    @EnvironmentObject var productsVM: ProductListViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(productsVM.clusters, id: \.self) { cluster in
                    Section(header: Text(cluster.tag)) {
                        ForEach(cluster.items, id: \.self) { item in
                            NavigationLink(item.title, destination: ProductDetailView(productId: item.id, productDetailImageUrl: item.imageUrl))
                        }
                    }
                }
            }.navigationTitle(Text("Products"))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        productListView(clusters: <#[Cluster]#>)
//    }
//}

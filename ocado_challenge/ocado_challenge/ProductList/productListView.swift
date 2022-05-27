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
                            NavigationLink(
                                destination: ProductDetailView(productId: item.id, productDetailImageUrl: item.imageUrl),
                                label: {
                                    ProductRow(product: item)
                                })
                        }
                    }
                }
            }.navigationTitle(Text("Products"))
        }
    }
}

struct ProductRow: View {
    @StateObject var imageVM = ImageViewModel()
    let product: Product
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(product.title)")
                Text("£ " + "\(product.price)")
                    .font(.footnote)
                
            }
            Spacer()
            imageVM.image
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        }.onAppear(perform: {
            imageVM.getNetworkImage(imageUrl: product.imageUrl)
        })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        productListView(clusters: <#[Cluster]#>)
//    }
//}

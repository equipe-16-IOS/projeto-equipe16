//
//  ContentView.swift
//  poc
//
//  Created by iredefbmac_28 on 23/05/25.
//
import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let brand: String
    let price: Double
    let imageName: String? // Agora pode ser nil se não tiver imagem
}

struct ContentView: View {
    let products = [
        Product(name: "Arroz", brand: "Camil", price: 5.99, imageName: "10723297"),
        Product(name: "Feijão", brand: "Marca B", price: 6.49, imageName: nil),
        Product(name: "Macarrão", brand: "Marca C", price: 3.99, imageName: nil)
    ]
    
    @State private var quantities = [0, 0, 0]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(products.indices, id: \.self) { index in
                    let product = products[index]
                    
                    HStack(alignment: .top, spacing: 16) {
                        if let imgName = product.imageName {
                            Image(imgName)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                                .overlay(Text("Sem imagem").font(.caption).foregroundColor(.gray))
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.name)
                                .font(.headline)
                            Text("Marca: \(product.brand)")
                                .font(.subheadline)
                            Text("Preço: R$ \(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                            
                            HStack {
                                Button(action: {
                                    if quantities[index] > 0 {
                                        quantities[index] -= 1
                                    }
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.title2)
                                }
                                
                                Text("\(quantities[index])")
                                    .frame(width: 30)
                                
                                Button(action: {
                                    quantities[index] += 1
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .font(.title2)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Produtos")
        }
    }
}

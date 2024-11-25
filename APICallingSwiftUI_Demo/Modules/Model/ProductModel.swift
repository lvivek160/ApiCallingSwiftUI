//
//  ProductModel.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable, Hashable {
    let products: [Product]?
    let total, skip, limit: Int?
    
    static let dummyProduct: Product = Product(
        id: 1,
        title: "Product",
        description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
        category: "beauty",
        price: 9.99,
        discountPercentage: 7.17,
        rating: 4.94,
        stock: 5,
        tags: [],
        brand: "Essence",
        sku: nil,
        weight: 2,
        dimensions: nil,
        warrantyInformation: nil,
        shippingInformation: nil,
        availabilityStatus: nil,
        reviews: [.init(rating: nil, comment: nil, date: "", reviewerName: "", reviewerEmail: "")],
        returnPolicy: "",
        minimumOrderQuantity: 1,
        meta: nil,
        images: [
          "https://g1.img-dpreview.com/80513CED05A944D08EDD9F1A75A58764.jpg",
          "https://g2.img-dpreview.com/81C81CB44922409EA3C99FA3E42369CD.jpg",
          "https://g1.img-dpreview.com/FF9CE2684532407EA326F7E9562EB91A.jpg",
          "https://g1.img-dpreview.com/8ABA6362533940E683F5870B45905762.jpg",
        ],
        thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
    )
}

// MARK: - Product
struct Product: Codable, Hashable {
    let id: Int?
    let title: String?
    let description: String?
    let category: String?
    let price, discountPercentage, rating: Double?
    let stock: Int?
    let tags: [String]?
    let brand, sku: String?
    let weight: Int?
    let dimensions: Dimensions?
    let warrantyInformation, shippingInformation: String?
    let availabilityStatus: String?
    let reviews: [Review]?
    let returnPolicy: String?
    let minimumOrderQuantity: Int?
    let meta: Meta?
    let images: [String]?
    let thumbnail: String?
}

// MARK: - Dimensions
struct Dimensions: Codable, Hashable {
    let width, height, depth: Double?
}

// MARK: - Review
struct Review: Codable, Hashable {
    let rating: Int?
    let comment: String?
    let date: String?
    let reviewerName, reviewerEmail: String?
}

// MARK: - Meta
struct Meta: Codable, Hashable {
    let createdAt: String?
    let updatedAt: String?
    let barcode: String?
    let qrCode: String?
}


//
//  Course.swift
//  Samples_CollecsionS_URLSession
//
//  Created by Dmitry Parhomenko on 31.01.2024.
//

import Foundation

/// Создаем модель для конкретного API
struct Course: Decodable {
    let name: String?
    let imageUrl: URL?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct SwiftBookInfo: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}

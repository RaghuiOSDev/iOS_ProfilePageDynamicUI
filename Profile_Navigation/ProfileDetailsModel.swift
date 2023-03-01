// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profileDetailsModel = try? JSONDecoder().decode(ProfileDetailsModel.self, from: jsonData)

import Foundation

// MARK: - ProfileDetailsModel
struct ProfileDetailsModel: Decodable {
    var message: String?
    var status: Int?
    var data: [ProfileDetailsData]?
}

// MARK: - Datum
struct ProfileDetailsData: Decodable {
    var type, placeHolder: String?
    var maxLength: Int?
    var label, inputType: String?
}



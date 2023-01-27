// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let foodResponse = try? JSONDecoder().decode(FoodResponse.self, from: jsonData)

import Foundation

// MARK: - FoodResponse
struct FoodResponse: Codable {
    
    var placeThatDoATasteyFoodSt: [PlaceThatDoATasteyFoodSt]

    enum CodingKeys: String, CodingKey {
        case placeThatDoATasteyFoodSt = "PlaceThatDoATasteyFoodSt"
    }
}

// MARK: - PlaceThatDoATasteyFoodSt
struct PlaceThatDoATasteyFoodSt: Codable {
    let head: [Head]?
    let row: [Row]?
}

// MARK: - Head
struct Head: Codable {
    let listTotalCount: Int?
    let result: Result?
    let apiVersion: String?

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case apiVersion = "api_version"
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable {
    let sigunNm, sigunCD, restrtNm, reprsntFoodNm: String
    let tastfdplcTelno: String
    let rmMatr: JSONNull?
    let refineLotnoAddr, refineRoadnmAddr, refineZipCD, refineWgs84Logt: String
    let refineWgs84Lat: String

    enum CodingKeys: String, CodingKey {
        case sigunNm = "SIGUN_NM"
        case sigunCD = "SIGUN_CD"
        case restrtNm = "RESTRT_NM"
        case reprsntFoodNm = "REPRSNT_FOOD_NM"
        case tastfdplcTelno = "TASTFDPLC_TELNO"
        case rmMatr = "RM_MATR"
        case refineLotnoAddr = "REFINE_LOTNO_ADDR"
        case refineRoadnmAddr = "REFINE_ROADNM_ADDR"
        case refineZipCD = "REFINE_ZIP_CD"
        case refineWgs84Logt = "REFINE_WGS84_LOGT"
        case refineWgs84Lat = "REFINE_WGS84_LAT"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

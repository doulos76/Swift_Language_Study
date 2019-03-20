import UIKit

struct DetailById: Decodable {
  let result: Result
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct Result: Decodable {
  let oil: [Oil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct Oil: Decodable {
  let uniId: String
  let pollDivCompany: String //PollDivCompany
  let gpollDivCompany: String //PollDivCompany
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let tel: String
  let sigunCode: String
  let lpgYN: String //LpgYN
  let maintenanceYN: String //MaintenanceYN
  let carWashYN: String //CarWashYN
  let kpetroYN: String //KpetroYN
  let cvsYN: String //CvsYN
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  var oilPrices: [Price]?
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCompany = "POLL_DIV_CO"
    case gpollDivCompany = "GPOLL_DIV_CO"
    case oilStationName = "OS_NM"
    case vanAddress = "VAN_ADR"
    case newAddress = "NEW_ADR"
    case tel = "TEL"
    case sigunCode = "SIGUNCD"
    case lpgYN = "LPG_YN"
    case maintenanceYN = "MAINT_YN"
    case carWashYN = "CAR_WASH_YN"
    case kpetroYN = "KPETRO_YN"
    case cvsYN = "CVS_YN"
    case gisXCoordinate = "GIS_X_COOR"
    case gisYCoordinate = "GIS_Y_COOR"
    case oilPrices = "OIL_PRICE"
  }
}

struct Price: Decodable {
  let productCode: String //ProductCode
  let price: Int
  let tradeDate: String
  let tradeTime: String
  
  enum CodingKeys: String, CodingKey {
    case productCode = "PRODCD"
    case price = "PRICE"
    case tradeDate = "TRADE_DT"
    case tradeTime = "TRADE_TM"
  }
}

enum MaintenanceYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum CarWashYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum LpgYN: String, Decodable {
  case y = "Y"
  case n = "N"
  case c = "C"
}

enum KpetroYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum CvsYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

typealias DetailByIdResponseCompletion = (DetailById?) -> Void
let OPINET_CODE = "F365181005"
let BASE_URL_STRING = "http://www.opinet.co.kr/api/"

let QUERY_OUT_JSON_AND_CODE = "?out=json&code="
let QUERY_OUT_JSON_AND_OPINET_CODE = QUERY_OUT_JSON_AND_CODE + OPINET_CODE
let DETAIL_BY_ID = BASE_URL_STRING + "detailById.do"

class DetailByIdApi {
  
  func detailById(uniId: String, completion: @escaping DetailByIdResponseCompletion) {
    let urlString = DETAIL_BY_ID + QUERY_OUT_JSON_AND_OPINET_CODE + "&id=\(uniId)"
    guard let url = URL(string: urlString) else { return }
    
    print("\n================[\(url)]================\n")
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      guard let data = data else { return }
      let jsonDecoder = JSONDecoder()
      do {
        let detailById = try jsonDecoder.decode(DetailById.self, from: data)
        //
        print("----> \(detailById.result.oil)")
        completion(detailById)
      } catch {
        print("\n================[error catch]================\n")
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}



let detailByIdApi = DetailByIdApi()
detailByIdApi.detailById(uniId: "A0008261") { (detailById) in
  DispatchQueue.main.async {
    print(detailById?.result.oil[0].oilStationName)
  }
  //  if let oil = detailById?.result.oil {
  ////    detailByIdOil = oil
  //    print(oil)
  //  }
}

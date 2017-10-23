import Foundation
import Alamofire
import Gryphon

extension API {
  final class Users: Requestable {

   static var baseURL: String {
    return "URLを設定する"
  }

  enum Router: String {
    case create = "/new/"
    case find = "/"
    case update = "/update/"
    case get_match = "/get_match/"
  }

  static var router: Router = .find // Default routing

  static var param: String = ""

  // required `Requestable`
  static var path: String {
    return baseURL + "/users" + router.rawValue + param
  }

  // Returns message(String) from server or error reason(Error).
  class func find(id: String) -> Task <[String : AnyObject], Error> {
    router = .find
    param = id

    let task = Task<[String : AnyObject], Error> { result in

      Alamofire.request(path, method: .get, encoding: JSONEncoding.default)
      .responseJSON(completionHandler: { response in
        let user = response.result.value as! [String : AnyObject]
        result(APIResult< [String : AnyObject]>.response(user))
        })
    }
    return task
  }
}
}

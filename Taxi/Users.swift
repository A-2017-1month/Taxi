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

  static var value: String = ""

  // required `Requestable`
  static var path: String {
    return baseURL + "/users" + router.rawValue + value
  }

  // Returns message(String) from server or error reason(Error).
  class func find(id: String) -> Task <[String : AnyObject], Error> {
    router = .find
    value = id

    let task = Task<[String : AnyObject], Error> { result in

      Alamofire.request(path, method: .get, encoding: JSONEncoding.default)
      .responseJSON(completionHandler: { response in
        let user = response.result.value as! [String : AnyObject]
        result(APIResult< [String : AnyObject]>.response(user))
        })
    }
    return task
  }

  class func get_match(name: String, email: String, account_name: String) -> Task <Int, Error> {
    router = .get_match
    value = ""
    let params : Parameters = [
    "name": name,
    "email": email,
    "account_name": account_name
    ]

    let task = Task<Int, Error> { result in

      Alamofire.request(path, method: .post, parameters: params, encoding: JSONEncoding.default)
      .responseJSON(completionHandler: { response in
        guard let statusCode = response.response?.statusCode else { return }

        if 200...299 ~= statusCode {
          result(APIResult<Int>.response(statusCode))
          }else{
            result(APIResult<Int>.error(ResponseError.unacceptableStatusCode(statusCode)))
          }
          })
    }
    return task
  }
}
}

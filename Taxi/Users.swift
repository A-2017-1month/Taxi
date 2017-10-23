import Foundation
import Alamofire
import Gryphon

extension API {
  final class Users: Requestable {

   static var baseURL: String {
    return "URLを設定する"
  }

  enum Router: String {
    case create =    "/new/"
    case find =      "/"
    case update =    "/update/"
    case get_match = "/get_match/"
    case login =     "/login/"
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

  class func create(name: String, email: String, account_name: String, password: String, billing_number: String, billing_name: String) -> Task <Int, Error> {
    router = .create
    value = ""
    let params : Parameters = [
    "name": name,
    "email": email,
    "account_name": account_name,
    "password": password,
    "billing_number": billing_number,
    "billing_name": billing_name
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

  class func login(account_name: String, password: String) -> Task <String, Error> {
    router = .login
    value = ""
    let params : Parameters = [
    "password": password,
    "account_name": account_name
    ]

    let task = Task<String, Error> { result in
      Alamofire.request(path, method: .get, encoding: JSONEncoding.default)
      .responseJSON(completionHandler: { response in
        let user = response.result.value as! [String : AnyObject]
        result(APIResult<String>.response(user["auth"]))
        })
    }
    return task
  }
}
}

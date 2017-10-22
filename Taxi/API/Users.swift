import Alamofire
import Gryphon

extension API {
  final class Users: Requestable {

    enum Router: String {
      case all = ""
      case create = "/new"
      case find = "/new/"
    }

    // required `Requestable`
    static var path: String {
      return baseURL + "/users" + router.rawValue
    }

    static var router: Router = .all // Default routing

    // Returns message(String) from server or error reason(Error).
    class func all() -> Task<[[String : String]], Error> {
      router = .all
      let task = Task<[[String : String]], Error> { result in

        Alamofire.request(path, method: .get, encoding: JSONEncoding.default)
        .responseJSON(completionHandler: { response in

          // Object mapping in your favorite way.
          guard let users = (response.result.value as! [AnyObject])[0]["result"] as? [[String : String]] else {

            let reason = response.result.description as AnyObject

            return result(APIResult<String>.error(ResponseError.unexceptedResponse(reason)))

          }

          result(APIResult<[[String : String]]>.response(users))

          })

      }

      return task
    }

  }
}

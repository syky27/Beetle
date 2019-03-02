import Alamofire

enum Router: URLRequestConvertible {
    case uploadFile(GitLab)
    case createIssue(GitLab, GitLabIssue)

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        switch self {
        case let .uploadFile(config):
            return "\(config.baseUrl)/api/v4/projects/\(config.project)/uploads"

        case .createIssue(let config, _):
            return "\(config.baseUrl)/api/v4/projects/\(config.project)/issues"
        }
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: path)!)

        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(beetleConfig?.privateToken ?? "", forHTTPHeaderField: "PRIVATE-TOKEN")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        switch self {
        case let .createIssue(_, issue):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: issue.params())
        default:
            break
        }

        return urlRequest
    }
}

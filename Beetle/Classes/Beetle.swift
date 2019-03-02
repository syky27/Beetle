//
//  Beetle.swift
//  Alamofire
//
//  Created by Tomas Sykora, jr. on 01/03/2019.
//

import Alamofire
import Foundation

var beetleConfig: GitLab?

open class Beetle {
    @discardableResult public init(_ gitlab: GitLab?) {
        beetleConfig = gitlab
    }

    public class func create(issue: GitLabIssue) {
        guard let config = beetleConfig else {
            return print("BEETLE: Missing config call Beetle(GitLab) in your AppDelegate.didFinishLaunching")
        }

        let request = Router.createIssue(config, issue)

        Alamofire.request(request).responseJSON { response in
            switch response.result {
            case let .success(json):
                if let j = json as? [String: Any] {
                    if let url = j["web_url"] as? String {
                        print("BEETLE reported issue to GitLab see it here: \(url)")
                    }
                } else {
                    print("BEETLE reported issue to GitLab")
                }

            case let .failure(error):
                print("BEETLE failed to report issue to GitLab see response:")
                print(error)
            }
        }
    }
}

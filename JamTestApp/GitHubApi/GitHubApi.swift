//
//  GithubApi.swift
//  JamTestApp
//
//  Created by Korisnik on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import Alamofire

typealias GitHubAPICompletedWithData = (_ success: Bool, _ message: String, _ data: Any?) -> Void

struct GithubApi {
    static func getListOfGithubRepositories(forQuery query: String, completed: @escaping GitHubAPICompletedWithData) {
        let urlPath = GithubApiEndpoints.getRepositoriesForQueryUrl + "?q=" + query
        guard let url = URL(string: urlPath) else { return }
        Alamofire.request(url, method: .get).responseJSON { response in
            let result = response.result
            
            switch result {
            case .failure:
                debugPrint("\(#function): json error")
                completed(false, AppStrings.ErrorMessage.internet, nil)
                return
            
            case .success:
                guard let dict = result.value as? [String: AnyObject],
                    let items = dict["items"] as? [Dictionary<String, AnyObject>] else {
                        debugPrint("\(#function): json error")
                        completed(false, "Error: json error", nil)
                        return
                }
                
                var repositories = [GitHubRepository]()
                for item in items {
                    print("------------------------------")
                    guard let name = item["name"] as? String,
                        let ownerData = item["owner"] as? [String: Any],
                        let ownerName = ownerData["login"] as? String,
                        let size = item["size"] as? Int,
                        let hasWiki = item["has_wiki"] as? Bool else {
                        debugPrint("\(#function): json error")
                        completed(false, "Error: json error", nil)
                        continue
                    }
                    print("\(ownerName)")
                    let newElement = GitHubRepository(name: name, owner: ownerName, size: size, hasWiki: hasWiki)
                    repositories.append(newElement)
                }
                completed(true, "Success", repositories)
            }
        }
    }
}

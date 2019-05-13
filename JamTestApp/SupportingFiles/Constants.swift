//
//  Constants.swift
//  JamTestApp
//
//  Created by Josip Rezic on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import UIKit

struct AppStrings {
    struct RepositoriesCollectionVC {
        static let title = "Repositories"
        static let collectionViewReuseId = "cell"
        static let defaultQuery = "tetris"
        static let searchDialogTitle = "Search"
        static let searchDialogMessage = "Search GitHub repositories"
        static let dismissActionTitle = "Dismiss"
        static let searchPlaceholder = "Type your query here..."
        static let noData = "No Data :("
    }
    
    struct ErrorMessage {
        static let internet = "Network error: Unable to connect"
        static let json = "Network error: JSON error"
    }
}

struct AppColors {
    struct RepositoriesCollectionVC {
        static let lightGray            = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let darkGray             = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        static let green                = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        static let black                = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        static let statusBarTextColor   = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

struct GithubApiEndpoints {
    static let getRepositoriesForQueryUrl = "https://api.github.com/search/repositories"
}

//
//  recipesEndPoint.swift
//  Recipes
//
//  Created by Dalia on 17/11/2023.
//

import Foundation
import Alamofire

enum RecipeEndPoint: Endpoint {
    case recipe
    var path: String {
        switch self {
        case .recipe:
            return "43427003d33f1f6b51cc"
        }
    }
    var headers: HTTPHeaders {
        var headers = defaultHeaders
        return headers
    }
    var parameters: Parameters?{
        let param = defaultParams
        return param
    }
    var method: HTTPMethod {
        switch self {
        case .recipe:
            return .get
        }
    }
}


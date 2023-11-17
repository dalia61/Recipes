//
//  NetworkManager.swift
//  Recipes
//
//  Created by Dalia on 10/08/2023.
//

import Alamofire
import Foundation
protocol NetworkProtocol: AnyObject {
    typealias CallResponse<T> = ((Result<T, NetworkError>) -> Void)?
    func callRequest<T>(_ object: T.Type, data: MultipartData?, endpoint: Endpoint,
                        onComplete: @escaping ((Result<T, NetworkError>) -> Void)) where T: Codable
}
struct MultipartData {
    var data: Data
    var fileName, mimeType, name: String
}
class AlamofireManager: NetworkProtocol {
  static let shared: AlamofireManager = AlamofireManager()
    private func uploadToServerWith<T: Codable>
    (_ decoder: T.Type, data: MultipartData, endpoint: Endpoint, completion: CallResponse<T>) {
        print(data.data)
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(data.data,
                                         withName: data.name,
                                         fileName: data.fileName,
                                         mimeType: data.mimeType)
                for (key, value) in endpoint.parameters ?? [:] {
                    multipartFormData.append("\(value)".data(using: .utf8) ?? Data(), withName: key)
                }
            },
            to: endpoint.requestURL,
            method: endpoint.method,
            headers: endpoint.headers
        ).validate(statusCode: 200 ..< 300)
        .responseJSON { response in
            // Handle the response
            switch response.result {
            case .success(let value):
                print("Response: \(value)")
                guard let model = try? JSONDecoder().decode(T.self, from: response.data!) else { return }
                completion?(.success(model))
            case .failure(_):
                if response.response?.statusCode == 409 {
                    guard let error = try? JSONDecoder()
                        .decode(ResponseError.self, from: response.data!) else { return }
                   print(response.response?.statusCode)
                    print("Error: \(error)")
                    completion?(.failure(NetworkError.custom(error)))
                }else {
                    completion?(.failure(NetworkError.somethingWentWrong))
                }
            }
        }
    }

    func callRequest<T>(_ object: T.Type, data: MultipartData? = nil, endpoint: Endpoint,
                        onComplete: @escaping ((Result<T, NetworkError>) -> Void)) where T: Decodable, T: Encodable {
        if let data = data {
          uploadToServerWith(object, data: data, endpoint: endpoint, completion: onComplete)
        } else {
            AF.request(endpoint).responseJSON { response in
                do {
                    guard let statusCode = response.response?.statusCode
                    else { return }
                    print(response.value)
                    switch statusCode {
                    case 200...299:
                        let model = try JSONDecoder().decode(T.self, from: response.data!)
                        onComplete(.success(model))
                    case 401:
                        let error = try JSONDecoder().decode(ResponseError.self, from: response.data!)
                        onComplete(.failure(NetworkError.custom(error)))
                    case 403:
                        onComplete(.failure(NetworkError.forbidden))
                    default:
                        onComplete(.failure(NetworkError.somethingWentWrong))
                    }
                } catch {
                    onComplete(.failure(NetworkError.somethingWentWrong))
                }
            }
        }
    }
}

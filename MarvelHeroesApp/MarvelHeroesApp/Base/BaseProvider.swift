//
//  BaseProvider.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import Alamofire

class BaseProvider: BaseProviderProtocol {
  enum ProviderType: Int {
    case json = 0
    case xml = 1
    case text = 2
  }

  enum ProviderSubType: Int {
    case dictionary = 0
    case array = 1
    case number = 2
    case status = 3
  }

  struct ProviderDTO {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethod
    var endpoint: String

    init(params: [String: Any]?,
         method: HTTPMethod,
         endpoint: String) {

      self.params = params
      self.method = method
      self.endpoint = endpoint
    }

    init(arrayParams: [[String: Any]]?,
         method: HTTPMethod,
         endpoint: String) {

      self.arrayParams = arrayParams
      self.method = method
      self.endpoint = endpoint
    }
  }

  var type: ProviderType = .json
  var subType: ProviderSubType = .dictionary
  var task: URLSessionTask?

  private var manager: Alamofire.Session!
  private func createManager(timeout: TimeInterval) -> Alamofire.Session {

    let evaluator = PinnedCertificatesTrustEvaluator()
    let manager = Alamofire.ServerTrustManager(evaluators: [DefaultManager.getBaseUrl(): evaluator])
    let session = Session(serverTrustManager: manager)

    return session
  }

  // MARK: EXTENSION
  func getProviderData(dto: ProviderDTO,
                       timeout: TimeInterval = 60,
                       loader: Bool = true,
                       printLog: Bool = true,
                       additionalHeader: [String: String] = [:],
                       success: @escaping(Data, Int) -> Void,
                       failure: @escaping() -> Void) -> URLSessionTask? {

    let baseURL = DefaultManager.getBaseUrl()
    var endpoint = "\(baseURL)\(dto.endpoint)"
    endpoint.append(MarvelUtils.getURLParams())

    var headers: HTTPHeaders = ["Content-Type": "application/json"]
    let parameters: [String: Any]? = dto.params

    //se añaden nuevas cabeceras si el parametro viene lleno. por defecto es nil i es opcional.
    if additionalHeader.count > 0 {
      for item in additionalHeader {
        headers[item.key] = item.value
      }
    }

    if self.manager == nil ||
        self.manager.session.configuration.timeoutIntervalForRequest != timeout {

      self.manager = self.createManager(timeout: timeout)
    }

    let request = self.manager.request(endpoint,
                                       method: dto.method,
                                       parameters: parameters,
                                       encoding: (dto.method == .post || dto.method == .put || dto.method == .patch) && dto.arrayParams == nil ? JSONEncoding.default : CustomGetEncoding(arrayParams: dto.arrayParams),
                                       headers: headers)

    let data = dto.arrayParams != nil
      ? try? JSONSerialization.data(withJSONObject: (dto.arrayParams ?? [:]), options: .prettyPrinted)
      : try? JSONSerialization.data(withJSONObject: (parameters ?? []), options: .prettyPrinted)
    if printLog {
      DefaultManager.print("*************************** LLAMADA ALAMOFIRE ***************************")
      DefaultManager.print("Fecha LLamada: \(Date().format(format: "dd/MM/yyyy-HH:mm:ss"))")
      DefaultManager.print("URL: \(endpoint)")
      DefaultManager.print("Method: \(dto.method)")
      DefaultManager.print("Headers: \(headers)")
      DefaultManager.print(String(data: data ?? Data(), encoding: .utf8) ?? "")
      DefaultManager.print("*************************** FIN ***************************")
    }

    if self.type == .json {
      request.responseJSON { response in

        if (200..<300).contains(response.response?.statusCode ?? 0) {
          // Se obtiene la respuesta.
          guard let data = response.data else {
            self.apiResponseError(loader: loader,
                                  response: response,
                                  failure: failure)
            return
          }

          if printLog {
            DefaultManager.print("*************************** RESPUESTA ALAMOFIRE ***************************")
            DefaultManager.print("Fecha Respuesta: \(Date().format(format: "dd/MM/yyyy-HH:mm:ss"))")
            DefaultManager.print("URL: \(endpoint)")
            DefaultManager.print(String(data: data, encoding: .utf8) ?? "")
            DefaultManager.print("*************************** ACABADA ***************************")
          }

          success(data, response.response?.statusCode ?? 0)
        } else {

          DefaultManager.print("*************************** RESPUESTA ALAMOFIRE ***************************")
          DefaultManager.print("Fecha Respuesta: \(Date().format(format: "dd/MM/yyyy-HH:mm:ss"))")
          DefaultManager.print("URL: \(endpoint)")

          self.apiResponseError(loader: loader,
                                response: response,
                                failure: failure)
          return
        }
      }
    } else {

      print("\nURL: \(endpoint)")
      print("\nParámetros: \(String(describing: dto.params))")

      request.responseString { response in
        if response.response?.statusCode == 200 {
          switch response.result {
          case let .success(value):
            let data = Data(value.utf8)

            success(data, response.response?.statusCode ?? 0)
          case .failure(_):
            self.apiResponseError(loader: loader,
                                  response: response,
                                  failure: failure)
            return
          }
        } else {
          self.apiResponseError(loader: loader,
                                response: response,
                                failure: failure)
          return
        }
      }
    }

    self.task = request.task
    return request.task
  }

  struct CustomGetEncoding: ParameterEncoding {
    var arrayParams: [[String: Any]]?

    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
      var request = try URLEncoding().encode(urlRequest, with: parameters)
      if let arrayParams = arrayParams, let httpBody = try? JSONSerialization.data(withJSONObject: arrayParams) {
        request.httpBody = httpBody
      }
      request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "="))
      return request
    }
  }

  fileprivate func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
      do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
      } catch {
        print(error.localizedDescription)
      }
    }
    return nil
  }

  fileprivate func apiResponseError(loader: Bool = true,
                                    response: AFDataResponse<Any>,
                                    failure: @escaping () -> Void) {

    DefaultManager.print(response.data ?? "")
    DefaultManager.print(response.response?.statusCode ?? "")
    DefaultManager.print("*************************** ACABADA ***************************")

    failure()
  }

  fileprivate func apiResponseError(loader: Bool = true,
                                    response: AFDataResponse<String>,
                                    failure: @escaping () -> Void) {

    DefaultManager.print(response.data ?? "")
    DefaultManager.print(response.response?.statusCode ?? "")
    DefaultManager.print("*************************** ACABADA ***************************")

    failure()
  }
}


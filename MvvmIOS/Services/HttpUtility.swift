//
//  HttpUtility.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 17/07/23.
//

import Foundation

struct HttpUtility{
    
    func getApiData<T: Decodable>(requestUrl:URL, resultType: T.Type,completionHandler: @escaping(_ result:T?)->Void){
        
        
        URLSession.shared.dataTask(with: requestUrl){(responseData, httpResponse,error) in
           
            if(error==nil && responseData != nil && responseData?.count != 0){
                let decoder = JSONDecoder()
                do{
                    let result =  try decoder.decode(T.self, from: responseData!)
                    completionHandler(result)
                }
                catch let error{
                    debugPrint("error while decoding \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    func postApiData<T: Decodable>(requestUrl:URL, requestBody: Data, resultType: T.Type,completionHandler: @escaping(_ result:T?)->Void){
        var urlRequest =  URLRequest(url: requestUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlRequest){(responseData, httpResponse,error) in
            if( responseData != nil && responseData?.count != 0){
                let decoder = JSONDecoder()
                
                do{
                    let result =  try decoder.decode(T.self, from: responseData!)
                    let jsonDecoder = JSONDecoder()
                    completionHandler(result)
                }
                catch let error{
                    debugPrint("error while decoding \(error.localizedDescription)")
                }
            }
        }.resume()
        
    }
}

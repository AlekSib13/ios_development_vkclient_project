//
//  ServiceInitialURLRequester.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation
import WebKit

protocol VKInitialURLRequestProtocol {
//    func createURL(completion: (_ createdUrl: URLRequest) -> Void) -> Void
    func makeUrlRequest(webView: WKWebView) -> Void
//    func makeUrlRequest(webView: WKWebView, completion: () -> Void) -> Void
}

class VKInitialURLRequest: VKInitialURLRequestProtocol {

    var urlComponents = URLComponents()
    
    private var urlRequest: URLRequest {
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7888664"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline,friends,photos,groups,notes,wall,newsfeed"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")]
        
        let urlRequest = URLRequest(url: urlComponents.url!)
        return urlRequest
    }
    
    func makeUrlRequest(webView: WKWebView) {
        let request = urlRequest
        webView.load(request)
        
    }
    
//    func makeUrlRequest(webView: WKWebView, completion: () -> Void) -> Void {
//        let request = urlRequest
//        webView.load(request)
//        completion()
//    }

}

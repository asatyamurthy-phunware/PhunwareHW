//
//  NetworkClient.swift
//  PhunwareHW
//
//  Created by Anjana on 3/13/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class NetworkClient {
    class func getFeedItems(completion: (result: Array<StarWarItem>) -> Void) {
        let URL = "https://raw.githubusercontent.com/phunware/services-interview-resources/master/feed.json"
        Alamofire.request(Method.GET, URL).responseArray { (response:Response<[StarWarItem], NSError>) -> Void in
            dispatch_async(dispatch_get_main_queue()) {
                completion(result: response.result.value!)
            }
        }
    }

}

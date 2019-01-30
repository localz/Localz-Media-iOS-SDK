//
//  LocalzMediaConstants.swift
//  LocalzMediaSDK
//
//  Created by Daniel Sykes-Turner on 15/11/18.
//  Copyright © 2018 Localz Pty Ltd. All rights reserved.
//

import Foundation

@objc public class LocalzMediaConstants: NSObject {

    /**
     The notification center name constant for observing starting upload/download events.
     
     **Note:** The `key` should be kept to track progress of following events.
     
     `OnStartNotification` userInfo contains:
     ```
     userInfo {
        "key" : LocalzMediaKey
     }
     ```
     */
    @objc public static let OnStartNotification = Notification.Name(rawValue: "LocalzMediaOnStartNotification")
    
    /**
     The notification center name constant for observing progressing upload/download events.
     
     `OnProgressNotification` userInfo contains:
     ```
     userInfo {
        "progress" : Double
        "key" : LocalzMediaKey
     }
     ```
     */
    @objc public static let OnProgressNotification = Notification.Name(rawValue: "LocalzMediaOnProgressNotification")
    
    /**
     The notification center name constant for observing successful upload/download events.
     
     `OnSuccessNotification` userInfo contains:
     ```
     userInfo {
        "data" : Data (optional)
        "key" : LocalzMediaKey
     }
     ```
     */
    @objc public static let OnSuccessNotification = Notification.Name(rawValue: "LocalzMediaOnSuccessNotification")
    
    /**
     The notification center name constant for observing successful upload/download events.
     
     `OnErrorNotification` userInfo contains:
     ```
     userInfo {
        "error" : Error
        "key" : LocalzMediaKey (optional)
     }
     ```
     */
    @objc public static let OnErrorNotification = Notification.Name(rawValue: "LocalzMediaOnErrorNotification")
}

//
//  LocalzMediaSDK.swift
//  LocalzMediaSDK
//
//  Created by Daniel Sykes-Turner on 14/11/18.
//  Copyright © 2018 Localz Pty Ltd. All rights reserved.
//

import Foundation

@objc public class LocalzMediaSDK: NSObject {

    private var authentication: LocalzMediaAuthManager = LocalzMediaAuthManager.shared
    private var media: LocalzMediaManager = LocalzMediaManager.shared
    
    /// The shared instance of LocalzMediaSDK
    @objc public static let shared = LocalzMediaSDK()
    
    private override init() {}
    
    // MARK: - Public Methods
    
    /**
     Initialises Localz Media SDK to piggyback on other SDKs.
     
     This does **not** set up the SDK for authenticating requests, so the projectKey, attendantKey, username, and password must be provided by another SDK's initialisation.
     To use the SDK without requiring any other SDKs, initialise with a `projectKey`, `attendantKey`, `username`, and `password`.
     
     - Parameters:
        - projectId: The project identifier of the Spotz project.
        - options: The SDK configuration options apply during initialisation.
    */
    
    @objc @discardableResult public init(withProjectId projectId: String, options: [String:Any]?) {
        
        super.init()
        authentication.setup(withProjectId: projectId, projectKey: nil, attendantKey: nil, username: nil, password: nil, options: options, completion: nil)
    }
    
    /**
     Initialises Localz Media SDK to function without other SDKs.
     
     - Parameters:
        - projectId: The project identifier of the Spotz project.
        - projectKey: The project secret key of the Spotz project.
        - attendantKey: The attendant secret key for the Spotz project.
        - username: The username of the attendant for the Spotz project.
        - password: The password of the attendant for the Spotz project.
        - options: The SDK configuration options apply during initialisation.
        - completion: The completion block which will be called on success or fail of the SDK's initialisation.
     */
    @objc @discardableResult public init(withProjectId projectId: String, projectKey: String, attendantKey: String, username: String, password: String, options: [String:Any]?, completion: ((_ error:Error?) -> Void)?) {
        
        super.init()
        authentication.setup(withProjectId: projectId, projectKey: projectKey, attendantKey: attendantKey, username: username, password: password, options: options, completion: completion)
    }
    
    /**
     Begins a single-part upload of data.
     
     This method will **not* work when the app is in a suspended state.
     Status updates to the upload will be reported via the notification center names:
     - OnStartNotification
     - OnProgressNotification
     - OnSuccessNotification
     - OnErrorNotification
     
     - Parameters:
         - data: The data object to upload.
         - extensionType: The file type extension of the data being uploaded (e.g. png, mov, gif).
    */
    @objc public func upload(data: Data, extensionType: String) {
        
        media.upload(data: data, extensionType: extensionType)
    }
    
    /**
     Begins a multi-part upload of data.
     
     This method will work when the app is in a suspended state.
     Status updates to the upload will be reported via the notification center names:
     - OnStartNotification
     - OnProgressNotification
     - OnSuccessNotification
     - OnErrorNotification
     
     - Parameters:
         - data: The data object to upload.
         - extensionType: The file type extension of the data being uploaded (e.g. png, mov, gif).
     */
    @objc public func uploadMultiPart(data: Data, extensionType: String) {
        
        media.multiPartUpload(data: data, extensionType: extensionType)
    }
    
    /**
     Begins a download of data using the key provided when
     
     This method will work when the app is in a suspended state.
     Status updates to the upload will be reported via the notification center names:
     - OnStartNotification
     - OnProgressNotification
     - OnSuccessNotification
     - OnErrorNotification
     
     - Parameters:
         - key: The key of identifiers to perform and authenticate the download
     */
    @objc public func download(key: LocalzMediaKey) {
        
        media.download(key: key)
    }
    
    /**
     Forwards the background task completion handler to the SDK to exit the background session when all tasks have completed.
     
     **Important:** This should be implemented in the AppDelegate by `application:handleEventsForBackgroundURLSession:completionHandler:`
     
     - Parameters:
         - completionHandler: The completion handler that will be called when all background session tasks have finished.
    */
    @objc public func setBackgroundCompletionHandler(completionHandler: (() -> Void)?) {
        
        media.setBackgroundCompletionHandler(completionHandler: completionHandler)
    }
}

//
//  LocalzMediaKey.swift
//  LocalzMediaSDK
//
//  Created by Daniel Sykes-Turner on 14/12/18.
//  Copyright © 2018 Localz Pty Ltd. All rights reserved.
//

import Foundation

@objc public class LocalzMediaKey: NSObject, NSCoding {
    
    // MARK: - Public Variables
    
    /// Internally used unique resource group identifier.
    @objc public var resourceId: String
    /// Internally and externally usable unique file identifier.
    @objc public var keyId: String
    /// Internally used unique multi-part upload identifier.
    @objc public var uploadId: String?
    
    // MARK: - Public Methods
    
    /**
     Initialise the LocalzMediaKey data response from the Localz API.
     
     - Parameters:
        - data: The response object containing a `resourceId`, `keyId`, and optionally an `uploadId`.
    */
    @objc public init(data: [String:Any]) {
        resourceId = data["resourceId"] as! String
        keyId = data["keyId"] as! String
        uploadId = data["uploadId"] as? String
    }
    
    /// Keyed archiver support.
    @objc public required init(coder decoder: NSCoder) {
        resourceId = decoder.decodeObject(forKey: "resourceId") as! String
        keyId = decoder.decodeObject(forKey: "keyId") as! String
        uploadId = decoder.decodeObject(forKey: "uploadId") as? String
    }
    
    /// Keyed unarchiver support.
    @objc public func encode(with coder: NSCoder) {
        coder.encode(resourceId, forKey: "resourceId")
        coder.encode(keyId, forKey: "keyId")
        coder.encode(uploadId, forKey: "uploadId")
    }
    
    @objc public override func isEqual(_ object: Any?) -> Bool {
        guard let key = object as? LocalzMediaKey else { return false }
        return resourceId == key.resourceId && keyId == key.keyId
    }
}

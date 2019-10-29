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
    /// Used to denote if it is located in the private or public bucket
    @objc public var isPublic: Bool
    
    // MARK: - Public Methods
    
    /**
     Initialise a new LocalzMediaKey with a random `resourceId` and `keyId`
     
     - Parameters:
         - isPublic: An optional value to denote whether the uploaded file will be publicly accessible.
    */
    @objc public init(isPublic: Bool = false) {
        self.resourceId = UUID().uuidString
        self.keyId = UUID().uuidString
        self.isPublic = isPublic
    }
    
    /**
     Initialise the LocalzMediaKey data response from the Localz API.
     
     - Parameters:
        - data: The response object containing a `resourceId`, `keyId`, and optionally an `uploadId`.
        - isPublic: An optional value to denote whether the uploaded file will be publicly accessible.
    */
    @objc public init(data: [String:Any], isPublic: Bool = false) {
        self.resourceId = data["resourceId"] as! String
        self.keyId = data["keyId"] as! String
        self.uploadId = data["uploadId"] as? String
        self.isPublic = isPublic
    }
    
    /// Keyed archiver support.
    @objc public required init(coder decoder: NSCoder) {
        self.resourceId = decoder.decodeObject(forKey: "resourceId") as! String
        self.keyId = decoder.decodeObject(forKey: "keyId") as! String
        self.uploadId = decoder.decodeObject(forKey: "uploadId") as? String
        self.isPublic = decoder.decodeBool(forKey: "isPublic")
    }
    
    /// Keyed unarchiver support.
    @objc public func encode(with coder: NSCoder) {
        coder.encode(self.resourceId, forKey: "resourceId")
        coder.encode(self.keyId, forKey: "keyId")
        coder.encode(self.uploadId, forKey: "uploadId")
        coder.encode(self.isPublic, forKey: "isPublic")
    }
    
    @objc public override func isEqual(_ object: Any?) -> Bool {
        guard let key = object as? LocalzMediaKey else { return false }
        return self.resourceId == key.resourceId
            && self.keyId == key.keyId
            && self.isPublic == key.isPublic
    }
}

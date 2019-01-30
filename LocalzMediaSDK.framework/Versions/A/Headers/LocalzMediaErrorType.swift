//
//  LocalzMediaErrorType.swift
//  LocalzMediaSDK
//
//  Created by Daniel Sykes-Turner on 2/12/18.
//  Copyright © 2018 Localz Pty Ltd. All rights reserved.
//

import Foundation

let LocalzMediaErrorDomain = "LocalzMediaErrorDomain"

///All types of LocalzMediaSDK errors.
@objc public enum LocalzMediaErrorType: Int {
    /// Invalid parameter given.
    case InvalidParameter = 1
    /// Response received from server is invalid.
    case EInvalidResponseFromServer = 2
    /// Unknown error.
    case EUnknownError = 3
    /// 404 error.
    case ENotFound = 4
    /// Not authorised error.
    case ENotAuthorised = 5
    /// User cancelled action.
    case EUserCancelled = 6
    /// Facebook related errors.
    case EFacebookError = 7
    /// Beacon related errors. _Not relevant to LocalzMediaSDK._
    case EBeaconError = 8
    /// Bluetooth not enabled. _Not relevant to LocalzMediaSDK._
    case EBluetoothNotEnabled = 9
    /// Location services not authorized. _Not relevant to LocalzMediaSDK._
    case ELocationNotAuthorized = 10
    /// Location services denied. _Not relevant to LocalzMediaSDK._
    case ELocationDenied = 11
    /// Location services not authorized. _Not relevant to LocalzMediaSDK._
    case ELocationNotEnabled = 12
    /// No projects available. _Not relevant to LocalzMediaSDK._
    case ENoProjectsAvailable = 13
    /// No sites available. _Not relevant to LocalzMediaSDK._
    case ENoSitesAvailable = 14
    /// No connection to the internet.
    case ENoConnection = 15
    /// Not relevant to LocalzMediaSDK. Failed obtaining location.
    case ELocationFailed = 16
    /// Local storage error.
    case ELocalStorageError = 17
}

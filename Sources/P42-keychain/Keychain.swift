//
//  Keychain.swift
//  PreRelease
//
//  Created by Diederick de Buck on 04/11/2022.
//

import Foundation


public final class Keychain {
    
    public static let instance = Keychain()
    
    public func getKeyChain(service: String, account: String) -> Data? {
        let query = [
            kSecReturnData: true,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        return (result as? Data)
    }
    
    public func addToKeyChain(secret: Data, service: String, account: String) -> Int32 {
        let query = [
            kSecValueData: secret,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        return SecItemAdd(query, nil)
    }
    
    public func delFromKeyChain(service: String, account: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        SecItemDelete(query)
    }
}

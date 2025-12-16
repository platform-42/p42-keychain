//
//  Security.swift
//  P42-keychain
//
//  Created by Diederick de Buck on 15/12/2025.
//
import Foundation

public class Security {
    
    @discardableResult
    public static func authorizeProfile(
        _ email: String,
        applicationName: String,
        serviceToken: String,
        secret: String
    ) -> Bool {
        let service = String(format: "%@.%@", applicationName, serviceToken)
        Keychain.instance.delFromKeyChain(
            service: service,
            account: email
        )
        let status = Keychain.instance.addToKeyChain(
            secret: Data(secret.utf8),
            service: service,
            account: email
        )
        return (status == 0)
    }
    
    public static func revokeProfile(
        _ email: String,
        applicationName: String,
        serviceToken: String
    ) {
        let service = String(format: "%@.%@", applicationName, serviceToken)
        Keychain.instance.delFromKeyChain(
            service: service,
            account: email
        )
    }
    
}

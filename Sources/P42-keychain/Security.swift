//
//  Security.swift
//  P42-keychain
//
//  Created by Diederick de Buck on 18/12/2025.
//

//
//  Security.swift
//  GA42
//
//  Created by Diederick de Buck on 16/12/2025.
//

import Foundation


public class Security {
    
    @discardableResult
    public static func authorizeObject(
        _ email: String,
        applicationId: String,
        objectId: String,
        secret: String
    ) -> Bool {
        let service = String(format: "%@.%@", applicationId, objectId)
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
    
    public static func revokeObject(
        _ email: String,
        applicationId: String,
        objectId: String
    ) {
        let service = String(format: "%@.%@", applicationId, objectId)
        Keychain.instance.delFromKeyChain(
            service: service,
            account: email
        )
    }
    
}

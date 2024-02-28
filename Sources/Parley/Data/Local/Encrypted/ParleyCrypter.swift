import Foundation
import CryptoKit

class ParleyCrypter {
    
    enum ParleyCrypterError: Error {
        case failedToEncrypt
    }
    
    private let key = SymmetricKey(size: .bits256)
    
    func encrypt(_ data: Data) throws -> Data {
        guard let encrypted = try AES.GCM.seal(data, using: key).combined else {
            throw ParleyCrypterError.failedToEncrypt
        }
        
        return encrypted
    }
    
    func decrypt(_ data: Data) throws -> Data {
        let sealedBox = try AES.GCM.SealedBox(combined: data)
        return try AES.GCM.open(sealedBox, using: key)
    }
}

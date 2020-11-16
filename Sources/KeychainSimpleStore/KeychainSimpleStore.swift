import KeychainAccess

public final class KeychainSimpleStore {
  
  private let service: String
  
  /**
   It's good to use BundleID as service.
   */
  public init(service: String) {
    self.service = service
  }
  
  private lazy var keychain: Keychain = {
    let keychain = Keychain(service: service)
      .accessibility(.always)
    return keychain
  }()
}

extension KeychainSimpleStore: SimpleStore {
  
  public func set(value: Any?, forKey key: String) {
    if let value = value as? String {
      do {
        try keychain.set(value, key: key)
      } catch {
        print("Could not save or update data to keychain for key: \(key)")
        print(error.localizedDescription)
      }
    } else {
      do {
        try keychain.remove(key)
      } catch {
        print("Could not delete data from keychain for key: \(key)]")
        print(error)
      }
    }
  }
  
  public func value(forKey key: String) -> Any? {
    do {
      return try keychain.get(key)
    } catch {
      return nil
    }
  }
}

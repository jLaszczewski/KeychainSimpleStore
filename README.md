# KeychainSimpleStore

# Exapmle of use
``` 
final class AuthData {

  static let bundleId = Bundle.main.bundleIdentifier
  
  private static let keyPrefix = "\(bundleId)."
  private let accessTokenKey = keyPrefix + "accessToken"
  private let refreshTokenKey = keyPrefix + "refreshToken"
  
  private store: SimpleStore = KeychainSimpleStore(service: bundleId)
  
  static let shared = AuthData()
  
  private init() {}
}

// MARK: - Computed properties
extension AuthData { 
  var isUserLoggedIn: Bool {
    accessToken.isSome
  }
}

// MARK: - AuthenticationData
extension AuthData { 
  
  private(set) var accessToken: String? {
    get {
      Store.secure.value(forKey: accessTokenKey) as? String
  } set {
    Store.secure.setValue(newValue, forKey: accessTokenKey)
  }
  
  private(set) var refreshToken: String? {
    get {
      Store.secure.value(forKey: refreshTokenKey) as? String
    } set {
      Store.secure.setValue(newValue, forKey: refreshTokenKey)
    }
  }
  
  func setAuthData(_ authenticationData: AuthenticationData) {
    accessToken = authenticationData.accessToken
    refreshToken = authenticationData.refreshToken
  }
  
  func removeAuthentication() {
    accessToken = nil
    refreshToken = nil
  }
}
```

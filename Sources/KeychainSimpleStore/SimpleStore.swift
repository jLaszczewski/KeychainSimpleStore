//
//  SimpleStore.swift
//  Fit Dostawcy
//
//  Created by Jakub Łaszczewski on 06/05/2019.
//  Copyright © 2019 Jakub Łaszczewski. All rights reserved.
//

/// Represents simple store allowing to save, read and delete values for keys.
public protocol SimpleStore {
  
  /// Sets value for given key in this store. If value is nil then value is removed.
  ///
  /// - Parameters:
  ///   - value: Value to be saved
  ///   - key: Key
  func set(value: Any?, forKey key: String)
  
  /// Reads value for given key from this store.
  ///
  /// - Parameter key: Key
  /// - Returns: Value for given key. If no value for key is found nil is returned.
  func value(forKey key: String) -> Any?
}

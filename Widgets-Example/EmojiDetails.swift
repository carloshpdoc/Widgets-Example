//
//  EmojiDetailse.swift
//  Widgets-Example
//
//  Created by Carlos Carmo on 02/10/21.
//

import Foundation

public struct EmojiDetails {
  public let emoji: String
  public let name: String
  public let description: String
}

// MARK: - Identifiable
extension EmojiDetails: Identifiable {
  public var id: String {
    emoji
  }
}

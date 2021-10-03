//
//  EmojiWidgetBundle.swift
//  Widgets-Example
//
//  Created by Carlos Carmo on 03/10/21.
//
import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {

  @WidgetBundleBuilder
  var body: some Widget {
    RandomEmojiWidget()
    CustomEmojiWidget()
  }
}

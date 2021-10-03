//
//  Emoji_Widgets.swift
//  Emoji Widgets
//
//  Created by Carlos Carmo on 02/10/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),  emojiDetails: EmojiProvider.random())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate,  emojiDetails: EmojiProvider.random())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    public let emojiDetails: EmojiDetails
}

struct Emoji_WidgetsEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        EmojiWidgetView(emojiDetails: entry.emojiDetails)
    }
}

@main
struct Emoji_Widgets: Widget {
    let kind: String = "Emoji_Widgets"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Emoji_WidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("Random Emoji")
        .description("Display a widget with an emoji that is updated randomly.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct Emoji_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Emoji_WidgetsEntryView(entry: SimpleEntry(date: Date(),  emojiDetails: EmojiProvider.random()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

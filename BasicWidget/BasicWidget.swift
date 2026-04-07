//
//  BasicWidget.swift
//  BasicWidget
//
//  Created by 김기태 on 4/6/26.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    // 위젯 최조 렌더링
    // 잠금화면에서 위젯 등록. 민감한 정보를 숨기고자 할 때 잠금해제하기 전까지으 placeholder
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    // 위젯 갤러리 미리보기 화면
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    // 위젯 상태 변경 시점
    // 미리 위젯 뷰를 그리고 있다가 시간에 맞춰 뷰를 업데이트 하고, TimelineEntry를 통해 특정 시간에 위젯을 업데이트 할 수 있도록 도와줌.
    // 위젯 뷰에 새로운 렌더링으로 업데이트 할 시기를 위젯킷에 알려줌.
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

// 위젯 구성 시 필요한 데이터
struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

// 실제 위젯에 대한 뷰 담당
struct BasicWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
            Text("Time:")
            Text(entry.date, style: .time)

            Text(UserDefaults.groupShared.string(forKey: "nick") ?? "없음")
            Text(entry.emoji)
        }
    }
}

// 최종적으로 구성되는 위젯
struct BasicWidget: Widget {
    let kind: String = "BasicWidget"

    var body: some WidgetConfiguration {
        // static이라 위젯 편집이 없는 정적인 상태로 위젯을 설정
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                BasicWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                BasicWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("Widget Testing")
//        .supportedFamilies([.systemSmall, .accessoryInline])
    }
}

#Preview(as: .systemSmall) {
    BasicWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}

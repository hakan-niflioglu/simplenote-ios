import WidgetKit

struct NotePreviewWidgetEntry: TimelineEntry {
    let date: Date
    let title: String
    let body: String
}

struct NotePreviewWidgetProvider: IntentTimelineProvider {
    typealias Intent = NoteWidgetIntent
    typealias Entry = NotePreviewWidgetEntry

    func placeholder(in context: Context) -> NotePreviewWidgetEntry {
        return NotePreviewWidgetEntry(date: Date(), title: "Placeholder", body: "Body Placeholder")
    }

    func getSnapshot(for configuration: NoteWidgetIntent, in context: Context, completion: @escaping (NotePreviewWidgetEntry) -> Void) {
        let entry = NotePreviewWidgetEntry(date: Date(), title: "Placeholder", body: "Body Placehoder")

        completion(entry)
    }

    func getTimeline(for configuration: NoteWidgetIntent, in context: Context, completion: @escaping (Timeline<NotePreviewWidgetEntry>) -> Void) {
        guard let note = configuration.note else {
            return
        }

        let title = "Twelve Tone Serialism"
        let body = "The twelve-tone technique is often closely related with the compositional style, serialism. Fundamentally, twelve-tone serialism is a compositional technique where all 12 notes of the chromatic scale are played with equal frequency throughout the piece without any emphasis on any one note. For this reason, twelve-tone serialism avoids being in any key. Arnold Schoenberg was arguably the most influential composers who embraced the twelve-tone technique. Schoenberg described the system as a “Method of composing with twelve tones which are related only with one another.”"

        let entry = NotePreviewWidgetEntry(date: Date(), title: title, body: body )
        let timeline = Timeline(entries: [entry], policy: .never)

        completion(timeline)
    }
}

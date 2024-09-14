import Foundation

struct Exercise: Identifiable {
    var id = UUID()
    var name: String
    var sets: Int
    var reps: Int
    var weight: Int
}

import Foundation

struct WorkoutSession: Identifiable {
    var id = UUID()
    var date: Date
    var exercises: [Exercise] = []
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

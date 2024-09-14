import SwiftUI

struct ContentView: View {
    @State private var workoutHistory = [WorkoutSession]()  // Store workout history here

    var body: some View {
        TabView {
            WorkoutView(workoutHistory: $workoutHistory)
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                    Text("New Workout")
                }

            HistoryView(workoutHistory: $workoutHistory)
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
        }
    }
}

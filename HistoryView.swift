import SwiftUI

struct HistoryView: View {
    @Binding var workoutHistory: [WorkoutSession]  // Bind to the workout history in the parent view

    var body: some View {
        VStack(alignment: .leading) {
            Text("Workout History")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.leading)

            List(workoutHistory) { session in
                VStack(alignment: .leading) {
                    Text("Workout on \(session.formattedDate)")
                        .font(.headline)

                    ForEach(session.exercises) { exercise in
                        Text("\(exercise.name): \(exercise.sets) sets of \(exercise.reps) reps at \(exercise.weight) lbs")
                    }
                }
                .padding(.vertical, 10)
            }
        }
    }
}

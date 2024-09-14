import SwiftUI

struct WorkoutView: View {
    @State private var exercises = [Exercise]()  // Exercises for the current workout
    @State private var currentExercise: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""
    @State private var weight: String = ""
    @State private var showingAlert = false

    @Binding var workoutHistory: [WorkoutSession]  // Bind to the workout history in the parent view

    var body: some View {
        VStack(alignment: .leading) {
            Text("New Workout")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.leading)
            
            TextField("Exercise Name", text: $currentExercise)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)

            HStack {
                TextField("Sets", text: $sets)
                    .keyboardType(.numberPad)  // Correct placement of .keyboardType
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)

                TextField("Reps", text: $reps)
                    .keyboardType(.numberPad)  // Correct placement of .keyboardType
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)

                TextField("Weight (lbs)", text: $weight)
                    .keyboardType(.numberPad)  // Correct placement of .keyboardType
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button(action: {
                guard !currentExercise.isEmpty, let sets = Int(sets), let reps = Int(reps), let weight = Int(weight) else {
                    showingAlert = true
                    return
                }

                let newExercise = Exercise(name: currentExercise, sets: sets, reps: reps, weight: weight)
                exercises.append(newExercise)

                currentExercise = ""
                self.sets = ""
                self.reps = ""
                self.weight = ""
            }) {
                Text("Add Exercise")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 10)
                    .padding(.horizontal)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Invalid Input"), message: Text("Please fill out all fields with valid numbers."), dismissButton: .default(Text("Got it!")))
            }

            List(exercises) { exercise in
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .font(.headline)
                    Text("Sets: \(exercise.sets), Reps: \(exercise.reps), Weight: \(exercise.weight) lbs")
                }
            }

            Button(action: {
                let newSession = WorkoutSession(date: Date(), exercises: exercises)
                workoutHistory.append(newSession)
                exercises.removeAll()  // Clear current workout
            }) {
                Text("Save Workout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.top, 10)
                    .padding(.horizontal)
            }
        }
        .padding(.bottom, 20)
    }
}

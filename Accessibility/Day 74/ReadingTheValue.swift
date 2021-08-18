// ReadingTheValue.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/reading-the-value-of-controls

// MARK: - LIBRARIES


import SwiftUI


struct ReadingTheValue: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var selectedValue: Double = 25.0
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         HStack {
            Text("0")
            Spacer()
            Text("50")
         }
         .font(.title)
         Slider(value: $selectedValue, in: 0...50)
            /// If you run that back
            /// you’ll hear that VoiceOver reads values as percentages , which makes no sense .
            /// To fix this, we can use the `accessibility(value:)` modifier to provide custom text ,
            /// like this :
            .accessibility(value: Text("\(Int(selectedValue))"))
            /// OLIVIER : Note how we typecast the `Double` value to an `Int` .
         Stepper("Rate our Service: \(Int(selectedValue))",
                 value: $selectedValue,
                 in: 0...50,
                 step: 5)
            /// When that runs , at least right now ,
            /// you can select the stepper and swipe up or down to change the value ,
            /// but VoiceOver won’t read out the values as they change .
            /// We can fix this by adding a custom read out for the values , like this :
            .accessibility(value: Text("\(selectedValue) out of 50"))
      }
      .padding()
   }
}





// MARK: - PREVIEWS -

struct ReadingTheValue_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ReadingTheValue()
   }
}

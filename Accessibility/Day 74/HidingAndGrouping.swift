// HidingAndGrouping.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/hiding-and-grouping-accessibility-data
/// Beyond setting labels and hints ,
/// there are several ways we can control what VoiceOver reads out .
/// There are three in particular I want to focus on :
/// `1` Marking images as being unimportant for VoiceOver.
/// `2` Hiding views from the accessibility system .
/// `3` Grouping several views as one .

// MARK: - LIBRARIES -

import SwiftUI



struct HidingAndGrouping: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         /// `1` Image(decorative:)` `tells SwiftUI it should be ignored by VoiceOver .
         Image(decorative: "kevin-horstmann-141705")
            /// This leaves the image as being accessible to VoiceOver if it has some important traits ,
            /// such as `.isButton` – it will say “button” when it’s highlighted ,
            /// and if we attach a tap gesture that works –
            /// but it doesn’t read out the image’s filename as the automatic VoiceOver label .
            .resizable()
            .scaledToFit()
            .accessibility(hidden: true)
            /// `2` With that modifier the image becomes invisible to VoiceOver regardless of what traits it has .
         HStack{
            Text("Your score is")
            Text(" 1000")
               .font(.title)
         }
         /// `3` This will cause both text views to be read together :
         // .accessibilityElement(children: .combine)
         /// That works really well when the child views contain separate information ,
         /// but in our case the children really should be read as a single entity .
         /// So , the better solution here is to use :
         .accessibilityElement(children: .ignore)
         .accessibility(label: Text("Your score is 1000"))
         /// `TIP`:
         /// Using `.combine` adds a pause between the two pieces of text ,
         /// because they aren’t necessarily designed to be read together .
         /// Using `.ignore` and a custom label means
         /// the text is read all at once ,
         /// and is much more natural .
      }
   }
}





// MARK: - PREVIEWS -

struct HidingAndGrouping_Previews: PreviewProvider {
   
   static var previews: some View {
      
      HidingAndGrouping()
   }
}

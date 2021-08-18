// IdentifyingViews.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/identifying-views-with-useful-labels

// MARK: - LIBRARIES -

import SwiftUI


struct IdentifyingViews: View {
   
   // MARK: PROPERTY WRAPPERS
   
   @State private var selectedPicture: Int = 0
   
   
   
   // MARK: PROPERTIES
   
   let pictures: Array<String> = [
      "ales-krivec-15949",
      "galina-n-189483",
      "kevin-horstmann-141705",
      "nicolas-tissot-335096"
   ]
   
   
   let accessibilityLabels: Array<String> = [
      "Tulips",
      "Frozen tree buds",
      "Sunflowers",
      "Fireworks"
   ]
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Image(pictures[selectedPicture])
         .resizable()
         .scaledToFit()
         .accessibility(label: Text(accessibilityLabels[selectedPicture]))
         .accessibility(addTraits: .isButton)
         .accessibility(removeTraits: .isImage)
         .onTapGesture {
            selectedPicture = Int.random(in: 0..<pictures.count)
         }
   }
}





// MARK: - PREVIEWS -

struct IdentifyingViews_Previews: PreviewProvider {
   
   static var previews: some View {
      
      IdentifyingViews()
   }
}

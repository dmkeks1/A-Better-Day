//
//  AddThingView.swift
//  A Better Day
//
//  Created by Dominik Zehe on 06.11.24.
//

import SwiftUI
import SwiftData

struct AddThingView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var thingTitle = ""
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 10) {
            TextField("What makes you feel good?", text: $thingTitle) // input here is bound to thingTitle var
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                // TODO: Add into SwiftData
                addThing() // executes function
                
                thingTitle = "" // sets thingtitle
                
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .disabled(thingTitle
                .trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
    }
    
    func addThing() {
        // TODO: clean the text
        let cleanedTitle = thingTitle.trimmingCharacters(in: .whitespacesAndNewlines) // cleans the textfield and fills varialbe
        // TODO: Add into DB
        context.insert(Thing(title: cleanedTitle)) //inserts cleanedTitle into the Thing array
        
        try?context.save()
        
        
    }
}

#Preview {
    AddThingView()
}

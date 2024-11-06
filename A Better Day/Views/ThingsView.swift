//
//  ThingView.swift
//  A Better Day
//
//  Created by Dominik Zehe on 06.11.24.
//

import SwiftUI
import SwiftData

struct ThingsView: View {
    
    @Query(filter: #Predicate<Thing>{ $0.isHidden == false}) private var things: [Thing]
    
    @State private var showAddView: Bool = false
    var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            Text("Things")
                .font(.largeTitle)
                .bold()
            
            Text("These are the things that make you feel good")
            
            List (things) { thing in
                Text(thing.title)
                
            }
            
            Spacer()
            
            Button("Add new thing") {
                //TODO: Show sheet to add thing
                showAddView.toggle() // toggles boolean
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
        .sheet(isPresented: $showAddView) {
            AddThingView()
                .presentationDetents([.fraction(0.8)])
        }
        
    }
}

#Preview {
    ThingsView()
}

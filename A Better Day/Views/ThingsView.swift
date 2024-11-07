//
//  ThingView.swift
//  A Better Day
//
//  Created by Dominik Zehe on 06.11.24.
//

import SwiftUI
import SwiftData

struct ThingsView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(filter: Day.currentDayPredicate(), sort: \.date) private var today: [Day]
    
    @Query(filter: #Predicate<Thing>{ $0.isHidden == false}) private var things: [Thing]
    
    @State private var showAddView: Bool = false
    var body: some View {
        
        
        
        VStack (alignment: .leading, spacing: 20) {
            Text("Things")
                .font(.largeTitle)
                .bold()
            
            Text("These are the things that make you feel good")
            
            List (things) { thing in
                
                
                let today = getToday()
                
                HStack {
                    Text(thing.title)
                    Spacer()
                    
                    Button {
                        // Add the thing to today
                        
                        today.things.append(thing)
                    } label: {
                        
                        // If this thing is already in todays thing list, show a solid checkmark instead
                        if today.things.contains(thing) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.blue)
                        }
                        else {
                            Image(systemName: "checkmark.circle")
                        }
                        
                    }
                    
                }
                
            }
            .listStyle(.plain)
            
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
    
    func getToday() -> Day {
        // Try to retrieve today from the database
        if today.count > 0 {
            return today.first!
        }
        else {
            // If it doenst exist, create a day and insert it
            let today = Day()
            try? context.save()
            
            return today
        }
        }
        
    }


#Preview {
    ThingsView()
}

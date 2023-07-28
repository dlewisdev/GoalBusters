//
//  AddActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct AddActivityView: View {
    @State private var name = ""
    @State private var description = ""
    @ObservedObject var oo: ActivityOO
    @State private var color = Color.black
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Spacer()
        
            VStack(alignment: .leading, spacing: 20) {
                Text("Add New Goal")
                    .font(.system(size: 30, design: .serif).weight(.bold))
                    .padding([.bottom, .leading])
                HStack {
                    Text("Name")
                        .font(.system(.headline, design: .serif))
                        .padding(5)
                    Spacer()
                    ColorPicker("", selection: $color)
                }
                TextField("\(name)", text: $name)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color, lineWidth: 2)
                    )
                    .padding(5)
                Text("Description")
                    .font(.system(.headline, design: .serif))
                    .padding(5)
                TextField(("\(description)"), text: $description)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color, lineWidth: 2)
                    )
                    .padding(5)
            }
            
            Spacer()
            
            Button {
                let goal = ActivityDO(name: name, description: description, color: color)
                oo.data.append(goal)
                dismiss()
            } label: {
                Text("Save")
                    .padding(12)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(color)
                    .cornerRadius(8)
            }
            .shadow(color: color, radius: 20, y: 5)
        
    }
}

#Preview {
    AddActivityView(oo: ActivityOO())
}
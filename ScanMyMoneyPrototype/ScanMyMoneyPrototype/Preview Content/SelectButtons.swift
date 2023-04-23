//
//  SelectButtons.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/20/23.
//

import SwiftUI

struct SelectButtons: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View {
       
        ZStack {
            Capsule()
                .frame(height: 50)
                .foregroundColor(isSelected ? color: Color("darkGreen"))
                Text(text)
                .foregroundColor(.white)
                
        }
    }
}

struct SelectButtons_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtons(isSelected: .constant(true), color: Color("darkGreen"), text: "Option")
    }
}

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
    @State var image: String
    @State var imagePlace: CGFloat
    @State var justIcon: Bool
    
    var body: some View {
        
        if (!justIcon) {
            ZStack {
                
                Capsule()
                
                    .frame(width: 300, height: 50)
                    .foregroundColor(isSelected ? color: Color("darkGreen"))
                Image(systemName: image)
                    .frame(maxWidth: imagePlace, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.title);
                Text(text)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .font(.title);
                
                
                
                
                
                
            }
        }
        else{
            ZStack {
                
                Capsule()
                    .frame(width: 50, height: 50)
                    .foregroundColor(isSelected ? color: Color("darkGreen"))
                Image(systemName: image)
                    .frame(maxWidth: imagePlace, alignment: .trailing)
                    .foregroundColor(.white)
                    .font(.title);
            }
        }
    }
}

struct SelectButtons_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtons(isSelected: .constant(true),
                      color: Color("darkGreen"),
                      text: "Camera Roll",
                      image: "camera.fill",
                    imagePlace: 0,
                      justIcon: true)
    }
}

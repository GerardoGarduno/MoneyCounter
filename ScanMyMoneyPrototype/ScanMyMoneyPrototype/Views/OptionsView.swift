//
//  OptionsView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/19/23.
//

import SwiftUI

struct OptionsView: View {
    @Namespace var namespace
    @State var startScreen = true
    @State var showOption = false
    @State var cameraScreen = false
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    @State var isSelected = false;
    @State var isSelected2 = false;
    var body: some View {
        HStack{
            VStack(spacing: 80) {
                Text("ScanMyMoney")
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 60,
                        alignment: .leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                //                        .font(.system(size: 30, weight: .medium, design: .default))
                    .font(.custom("impact", size: 30).weight(.bold))
                    .foregroundColor(Color.white)
                    .background(
                        
                        Color("darkGreen").matchedGeometryEffect(id: "background", in: namespace)
                    )
                
                
                Text("Choose an Option".uppercased())
                    .font(.custom("impact", size: 30).weight(.bold))
                   
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 60,
                        alignment: .center)
                //                        .font(.system(size: 30, weight: .medium, design: .default))
                    .font(.custom("impact", size: 30).weight(.bold))
                    .foregroundColor(Color("darkGreen"))
                
                
                
                
                VStack(spacing: 20) {
//                    SelectButton(
//                        isSelected: $isSelected,
//                        color: Color("darkGreen"),
//                        text: "Yes")
//                    ).onTapGesture {
//                        if {
//
//                        }
//                    }
                    Button {
                        
                    } label: {
                        Label("Photo Library", systemImage: "camera.fill")
                            .font(.system(size: 35))
                        
                    }
                    .foregroundColor(.white)
                    .background(Color("darkGreen"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color("darkGreen"))
                    .cornerRadius(15)
                    
                    Button {
                        
                    } label: {
                        Label("Photo Library", systemImage: "camera.fill")
                            .font(.system(size: 35))
                        
                    }
                    .foregroundColor(.white)
                    .background(Color("darkGreen"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color("darkGreen"))
                    .cornerRadius(15)
                }
                
                Spacer()
            }
            
            VStack(spacing: 10){
                
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}

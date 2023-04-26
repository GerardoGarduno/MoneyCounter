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
    
    @State var camera = false;
    @State var photoLib = false;
    @State var wallet = false;
    var body: some View {
        HStack{
            VStack(spacing: 45) {
                Text("ScanMyMoney")
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 60,
                        alignment: .leading)
                    .padding(.leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                //                        .font(.system(size: 30, weight: .medium, design: .default))
                    //.font(.custom("impact", size: 30).weight(.bold))
                    .font(.system(size: 30 ,weight: .heavy, design: .default))
                    .foregroundColor(Color.white)
                    .background(
                        
                        Color("darkGreen").matchedGeometryEffect(id: "background", in: namespace)
                    )
                
                
                Text("Choose an Option".uppercased())
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 60,
                        alignment: .center)
                //                        .font(.system(size: 30, weight: .medium, design: .default))
                    .font(.title).bold()
                    .foregroundColor(Color("darkGreen"))
                
                
                
                
                VStack(spacing: 40) {
                    SelectButtons(
                        isSelected: $camera,
                        color: Color("darkGreen"),
                        text: "Camera Roll",
                        image: "camera",
                        imagePlace: 250,
                        justIcon: false)
                        .onTapGesture {
                        if camera{
                            photoLib = false
                        }
                        
                    }
                    
                    SelectButtons(
                        isSelected: $photoLib,
                        color: Color("darkGreen"),
                        text: "Photo Library",
                        image: "camera",
                        imagePlace: 250,
                        justIcon: false)
                        .onTapGesture {
                        if photoLib{
                            camera = false
                        }
                    }
                    
                    SelectButtons(
                        isSelected: $wallet,
                        color: Color("darkGreen"),
                        text: "Wallet",
                        image: "banknote.fill",
                        imagePlace: 250,
                        justIcon: false)
                        .onTapGesture {
                        if photoLib{
                            camera = false
                        }
                    }
                 
                }
                Image("MoneyIcon")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFit()
                    
                    
                Spacer()
            }
            
           
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}

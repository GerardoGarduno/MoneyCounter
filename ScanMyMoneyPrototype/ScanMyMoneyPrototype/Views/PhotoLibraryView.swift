//
//  PhotoLibraryView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/25/23.
//

import SwiftUI

struct PhotoLibraryView: View {
    
    @Namespace var namespace
    @State var startScreen = true
    @State var showOption = false
    @State var cameraScreen = false
    @State var changeProfileImage = false
    @State var openCameraRoll = true
    @State var imageSelected = UIImage()
    
    @State var camera = false
    @State var photoLib = false
    @State var wallet = false
    
    @State var numOnes: Int = 0
    @State var ones: String = "x $1"
    @State var percentOnes: Int = 0
    
    @State var numFives: Int = 0
    @State var fives: String = "x $5"
    @State var percentFives: Int = 0
    
    @State var numTens: Int = 0
    @State var tens: String = "x $10"
    @State var percentTens: Int = 0
    
    @State var numTwenties: Int = 0
    @State var twenties: String = "x $20"
    @State var percentTwenties: Int = 0
    
    @State var numFifties: Int = 0
    @State var fifties: String = "x $50"
    @State var percentFifties: Int = 0
    
    @State var numHundreds: Int = 0
    @State var hundreds: String = "x $100"
    @State var percentHundreds: Int = 0
    
    @State var amountDetected: Int
    
    var body: some View {
        VStack(spacing: 40) {
            ZStack{
                Text("Result")
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 60,
                        alignment: .leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .padding(.leading)
                    .font(.system(size:30, weight: .heavy, design: .default))
                    .foregroundColor(Color.white)
                    .background(
                        Color("darkGreen").matchedGeometryEffect(id: "background", in: namespace)
                    )
                
                    SelectButtons(
                        isSelected: $camera,
                        color: Color("darkGreen"),
                        text: "",
                        image: "camera.fill",
                        imagePlace: 350,
                        justIcon: true)
                    .frame(alignment: .trailing)
                    .onTapGesture {
                        camera = true
                        if camera{
                            photoLib = false
                            wallet = false
                        }
                        
                    }
                    
                    SelectButtons(
                        isSelected: $photoLib,
                        color: Color("darkGreen"),
                        text: "",
                        image: "banknote.fill",
                        imagePlace: 200,
                        justIcon: true)
                    .frame(alignment: .trailing)
                    .onTapGesture {
                        photoLib = true
                        if photoLib{
                            photoLib = false
                            wallet = false
                        }
                        
                    }
            }
                Image(uiImage: imageSelected)
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                
                Text("Total Amount Detected: $" + "\(amountDetected)")
                    .font(.custom("HelveticaNeue", size: 30))
                
                    .frame(alignment: .center)
                
                List {
                    
                    Text("BreakDown")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                        .underline()
                    
                    Text("\(numOnes) " + ones +  " conf: \(percentOnes)%")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                    Text("\(numFives) " + fives + " conf: \(percentFives)%")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                    Text("\(numTens) " + tens + " conf: \(percentTens)%")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                    Text("\(numTwenties) " + twenties + " conf: \(percentTwenties)%")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                    Text("\(numFifties) " + fifties + " conf: \(percentFifties)%")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                    Text("\(numHundreds) " + hundreds + " conf: \(percentHundreds)%")
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                }
                .font(.custom("HelveticaNeue", size: 30))
                .scrollContentBackground(.hidden)
                .background(Color("darkGreen"))
                .foregroundColor(Color("darkGreen"))
                
            }
            
        
    }
}

struct PhotoLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLibraryView(amountDetected: 0)
    }
}

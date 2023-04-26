//
//  walletView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/25/23.
//

import SwiftUI



struct walletView: View {
    @Namespace var namespace
    @State var startScreen = true
    @State var showOption = false
    @State var cameraScreen = false
    @State var changeProfileImage = false
    @State var openCameraRoll = false
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
    
    @State var totalMoney: Int = 0
    
    @State var lastScan: Int = 0
    
    @State var amountDetected: Int
    var body: some View {
        VStack(spacing: 20) {
           
                ZStack{
                    Text("Wallet")
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
                            openCameraRoll = true
                            photoLib = false
                            wallet = false
                        }
                        
                    }
                    
                    SelectButtons(
                        isSelected: $photoLib,
                        color: Color("darkGreen"),
                        text: "",
                        image: "photo.fill.on.rectangle.fill",
                        imagePlace: 200,
                        justIcon: true)
                    .frame(alignment: .trailing)
                    .onTapGesture {
                        photoLib = true
                        if photoLib{
                            openCameraRoll = true
                            camera = false
                            wallet = false
                        }
                        
                    }
                
            }
            ZStack {
                
                Image("wallet")
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                    .matchedGeometryEffect(id: "wallet", in: namespace)
                
                Text("$ " + "\(totalMoney)")
                    .font(.custom("HelveticaNeue",size: 40)).bold()
                    .frame(width: 275, height: 175, alignment: .center)
                    .matchedGeometryEffect(id: "wallet", in: namespace)
                    .foregroundColor(Color("darkGreen"))
            }
            
            Text("Last Scan")
                .font(.custom("HelveticaNeue",size: 40)).bold()
                .frame(width: 300, height: 40, alignment: .center)
                .padding()
                .background(Color("darkGreen"))
                .foregroundColor(.white)
            
            Text("$" + "\(lastScan)")
                .font(.custom("HelveticaNeue",size: 60)).bold()
                .frame(width: 300, height: 5, alignment: .center)
                .padding()
                .foregroundColor(Color("darkGreen"))
            
            Text("Saved Scans:")
                .font(.custom("HelveticaNeue",size: 40)).bold()
                .frame(width: 300, height: 25, alignment: .center)
                .foregroundColor(Color("darkGreen"))
                
            
            List {
                
                Text("\(numOnes) " + ones)
                    .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                
                Text("\(numFives) " + fives)
                    .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                
                Text("\(numTens) " + tens)
                    .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                
                Text("\(numTwenties) " + twenties)
                    .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                
                Text("\(numFifties) " + fifties)
                    .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
                    
                Text("\(numHundreds) " + hundreds)
                        .frame(maxWidth: 350, maxHeight: 50 ,alignment: .center)
            }
            .font(.custom("HelveticaNeue", size: 30))
            .scrollContentBackground(.hidden)
            .background(Color("darkGreen"))
            .foregroundColor(Color("darkGreen"))
            .scrollDisabled(true)

                
           
        } //VStack
        
            
        Spacer()
        }
}

struct walletView_Previews: PreviewProvider {
    static var previews: some View {
        walletView(amountDetected: 40)
    }
}

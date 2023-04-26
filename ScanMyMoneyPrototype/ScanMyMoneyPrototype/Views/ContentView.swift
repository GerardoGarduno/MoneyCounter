//
//  ContentView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/7/23.
//

import SwiftUI





struct ContentView: View {
    
   
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
    
    @State var totalMoney: Int = 0
    
    @State var lastScan: Int = 0
    
    var body: some View {
        
        if startScreen {
            ZStack {
                if !showOption {
                    VStack {
                        Image("MoneyIcon")
                            .imageScale(.medium)
                            .foregroundColor(.accentColor)
                        
                            .scaledToFit()
                        Text("ScanMyMoney")
                        //.multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .bold()
                            //.font(.custom("Impact", size: 50).weight(.thin))
                            .font(.system(size:30, weight: .heavy, design: .default))
                        //.font(.custom("impact", size: 50))
                            .foregroundColor(Color.white)
                            .foregroundStyle(.black)
                            .background(
                                Color("darkGreen")
                            .matchedGeometryEffect(id: "background", in: namespace)
                            )
                            .cornerRadius(90)
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .hapticFeedback()
                    }
                    .padding()
                }
                //---------------------------------------
                if showOption{
                    HStack{
                        VStack(spacing: 45) {
                            Text("ScanMyMoney")
                                .frame(
                                    maxWidth: .infinity,
                                    minHeight: 60,
                                    alignment: .leading)
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .padding(.leading)
                            //                        .font(.system(size: 30, weight: .medium, design: .default))
                                //.font(.custom("impact", size: 30).weight(.bold))
                                .font(.system(size:30, weight: .heavy, design: .default))
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
                                    image: "camera.fill",
                                    imagePlace: 250,
                                    justIcon: false)
                                    .onTapGesture {
                                        camera = true
                                    if camera{
                                        startScreen = false
                                        photoLib = false
                                        wallet = false
                                    }
                                    
                                }
                                
                                SelectButtons(
                                    isSelected: $photoLib,
                                    color: Color("darkGreen"),
                                    text: " Photo Library",
                                    image: "photo.fill.on.rectangle.fill",
                                    imagePlace: 250,
                                    justIcon: false)
                                    .onTapGesture {
                                        photoLib = true
                                    if photoLib{
                                        startScreen = false
                                        camera = false
                                        wallet = false
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
                                        wallet = true
                                    if wallet{
                                        startScreen = false
                                        camera = false
                                        photoLib = false
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
            .onTapGesture {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.8)) {
                    showOption = true
                }
                
            }
        }
        //------------------------------------------------------
        if photoLib{
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
                                openCameraRoll = true
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
                                camera = false
                                wallet = false
                                openCameraRoll = true
                            }
                            
                        }
                    
                    SelectButtons(
                        isSelected: $wallet,
                        color: Color("darkGreen"),
                        text: "",
                        image: "banknote.fill",
                        imagePlace: 50,
                        justIcon: true)
                        .onTapGesture {
                            wallet = true
                        if wallet{
                            startScreen = false
                            camera = false
                            photoLib = false
                        }
                    }
                    
                    
                }.sheet(isPresented: $openCameraRoll) {
                    ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
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
            Spacer()
                
        }
        if camera{
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
                                openCameraRoll = true
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
                                camera = false
                                wallet = false
                                openCameraRoll = true
                            }
                            
                        }
                    
                    SelectButtons(
                        isSelected: $wallet,
                        color: Color("darkGreen"),
                        text: "",
                        image: "banknote.fill",
                        imagePlace: 50,
                        justIcon: true)
                        .onTapGesture {
                            wallet = true
                        if wallet{
                            startScreen = false
                            camera = false
                            photoLib = false
                        }
                    }
                    
                    
                }.sheet(isPresented: $openCameraRoll) {
                    ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
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
            Spacer()
        }
        if wallet {
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
        }
    } // -- body
} // -- struct


extension View{
    func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
        self.onTapGesture {
            let impact = UIImpactFeedbackGenerator(style: .heavy)
            impact.impactOccurred()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(amountDetected: 40)
    }
}

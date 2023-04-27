//
//  imagePicker.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/19/23.
//

import SwiftUI
import UIKit


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        /*
        //----------------------------
        // Load Image and Convert to Base64
        let image = UIImage(uiImage: imagePicker) // path to image to upload ex: image.jpg
        let imageData = image?.jpegData(compressionQuality: 1)
        let fileContent = imageData?.base64EncodedString()
        let postData = fileContent!.data(using: .utf8)

        // Initialize Inference Server Request with API KEY, Model, and Model Version
        var request = URLRequest(url: URL(string: "https://detect.roboflow.com/usd-money/2?api_key=sqDcYOoGebzrxPm0n9sO&name=YOUR_IMAGE.jpg")!,timeoutInterval: Double.infinity)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData

        // Execute Post Request
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in

            // Parse Response to String
            guard let data = data else {
                print(String(describing: error))
                return
            }

            // Convert Response String to Dictionary
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }

            // Print String Response
            print(String(data: data, encoding: .utf8)!)
        }).resume()
        
        //-----------------------------
        */
        
        return imagePicker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //leave alone for right now
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
     
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
   
    
}

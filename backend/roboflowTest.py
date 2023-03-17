from roboflow import Roboflow
import os
#establising connection to ROBOFLOW api
rf = Roboflow(api_key="sqDcYOoGebzrxPm0n9sO")

project = rf.workspace().project("usd-money")
model = project.version(2).model

# infer on a local image
#print(model.predict("1dollarexample.jpg", confidence=40, overlap=30).json())

#find the image folder relative to this python  scipt
script_folder = os.path.dirname(os.path.abspath(__file__))
image_folder = os.path.join(script_folder, 'images')

#save the iles
image_files = [os.path.join(image_folder, file) for file in os.listdir(image_folder) if file.endswith('.jpg')]

# Make predictions for each image in the folder
total = 0;
for image_file in image_files:
    prediction = model.predict(image_file, confidence=40, overlap=30).json()
    for obj in prediction['predictions']:
        label = obj['class']
        confidence = obj['confidence']
        print(f"Image: {image_file} | Label: {label} | Confidence: {confidence}")
        if (label == '100Dollar'):
            total += 100
        if (label == '50Dollar'):
            total += 50
        if (label == '20Dollar'):
            total += 20
        if (label == '10Dollar'):
            total += 10
        if(label == '5Dollar'):
            total +=5
        if (label == '1Dollar'):
            total += 1
    #print(prediction, "\n")
print("Total amount of money in the images folder..:",total)
   


# visualize your prediction
#model.predict("1dollarexample.jpg", confidence=40, overlap=30).save("prediction.jpg")

# infer on an image hosted elsewhere
# print(model.predict("URL_OF_YOUR_IMAGE", hosted=True, confidence=40, overlap=30).json())
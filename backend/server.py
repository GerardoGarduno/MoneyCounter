from flask import Flask, jsonify, request
from flask_cors import CORS
from roboflow import Roboflow
import os
import base64
import datetime
from PIL import Image
from io import BytesIO

app = Flask(__name__)
CORS(app)

# Establishing connection to ROBOFLOW api
rf = Roboflow(api_key="sqDcYOoGebzrxPm0n9sO")
project = rf.workspace().project("usd-money")
model = project.version(2).model

# Find the image folder relative to this python script
script_folder = os.path.dirname(os.path.abspath(__file__))
image_folder = os.path.join(script_folder, 'images')

# Initialize total and bills
total = 0
bills = []
#funtion that runs the model on entire wallet
def process_images():
    global total, bills
    total = 0
    bills = []
    image_files = [os.path.join(image_folder, file) for file in os.listdir(image_folder) if file.endswith('.jpg')]
    for image_file in image_files:
        prediction = model.predict(image_file, confidence=4, overlap=30).json()
        for obj in prediction['predictions']:
            print(obj)
            label = obj['class']
            if label == '100Dollar':
                total += 100
            elif label == '50Dollar':
                total += 50
            elif label == '20Dollar':
                total += 20
            elif label == '10Dollar':
                total += 10
            elif label == '5Dollar':
                total += 5
            elif label == '1Dollar':
                total += 1  
            elif label == '':
                print("tring to make unknoen")
                label = 'UnknownBill'
            confidence = obj['confidence']
            bills.append({'label': label, 'confidence': confidence})
           # window.notify("Successfully read ${label} bill from image.");

@app.route('/total')
def get_total():
    return jsonify({'total': total})

@app.route('/bills')
def get_bills():
    return jsonify({'bills': bills})

@app.route('/upload', methods=['POST'])
def upload():
    try:
        files = request.files.getlist('file')
        for file in files:
            file.save(os.path.join(app.root_path, 'images', file.filename))
        process_images()  # Process the uploaded images to update total and bills
        return jsonify({'success': True})
    except Exception as e:
        print(str(e))
        return jsonify({'success': False}), 500

#new route for webcame upload ???
@app.route('/upload_image', methods=['POST'])
def upload_image():
    # Get the image data from the request
    image_str = request.form.get('image')
    #print(image_data)
    # Extract the base64 data from the image string
    image_data = image_str.split(',')[1]

    # Decode the base64 data into bytes
    image_bytes = base64.b64decode(image_data)

    # Create an image object from the bytes
    image = Image.open(BytesIO(image_bytes))

    # Generate a unique filename
    timestamp = datetime.datetime.now()
    filename = f"{timestamp}.jpg"

    # Save the image to the images folder
    if not os.path.exists('images'):
        os.makedirs('images')
    image.save(os.path.join('images', filename), 'JPEG')

    # Open the image using the default viewer
    #image.show()
    response = {'message': 'Image uploaded successfully'}
    return jsonify(response), 200
#on server start process the images
@app.route('/upload_image_model', methods=['POST'])
def run_model_screenshot():
    # Get the image data from the request
    image_str = request.form.get('image')
    image_data = image_str.split(',')[1]

    # Decode the base64 data into bytes
    image_bytes = base64.b64decode(image_data)

    # Create an image object from the bytes
    image = Image.open(BytesIO(image_bytes))
    print(image_data)
    # prediction = model.predict(image_str, confidence=4, overlap=30).json()

    # for obj in prediction['predictions']:
    #     print(obj)
    response = {'message': 'Image uploaded successfully'}
    return jsonify(response), 200
process_images()
print("runnning server")

if __name__ == '__main__':
    app.run(debug=True)
   

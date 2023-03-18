from flask import Flask, jsonify, request
from flask_cors import CORS
from roboflow import Roboflow
import os

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

def process_images():
    global total, bills
    total = 0
    bills = []
    image_files = [os.path.join(image_folder, file) for file in os.listdir(image_folder) if file.endswith('.jpg')]
    for image_file in image_files:
        prediction = model.predict(image_file, confidence=40, overlap=30).json()
        for obj in prediction['predictions']:
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
            confidence = obj['confidence']
            bills.append({'label': label, 'confidence': confidence})

# Process the images once at server startup
process_images()

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


if __name__ == '__main__':
    app.run(debug=True)

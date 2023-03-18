from roboflow import Roboflow
import os
from flask import Flask, jsonify

app = Flask(__name__)

#establising connection to ROBOFLOW api
rf = Roboflow(api_key="sqDcYOoGebzrxPm0n9sO")

project = rf.workspace().project("usd-money")
model = project.version(2).model

#find the image folder relative to this python  scipt
script_folder = os.path.dirname(os.path.abspath(__file__))
image_folder = os.path.join(script_folder, 'images')

#save the iles
image_files = [os.path.join(image_folder, file) for file in os.listdir(image_folder) if file.endswith('.jpg')]

@app.route('/total')
def get_total():
    total = 0
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
    return jsonify({'total': total})

@app.route('/bills')
def get_bills():
    bills = []
    for image_file in image_files:
        prediction = model.predict(image_file, confidence=40, overlap=30).json()
        for obj in prediction['predictions']:
            label = obj['class']
            confidence = obj['confidence']
            bills.append({'label': label, 'confidence': confidence})
    return jsonify({'bills': bills})

if __name__ == '__main__':
    app.run(debug=True)

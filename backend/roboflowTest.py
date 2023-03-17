from roboflow import Roboflow
rf = Roboflow(api_key="sqDcYOoGebzrxPm0n9sO")
project = rf.workspace().project("usd-money")
model = project.version(2).model

# infer on a local image
print(model.predict("1dollarexample.jpg", confidence=40, overlap=30).json())

# visualize your prediction
model.predict("1dollarexample.jpg", confidence=40, overlap=30).save("prediction.jpg")

# infer on an image hosted elsewhere
# print(model.predict("URL_OF_YOUR_IMAGE", hosted=True, confidence=40, overlap=30).json())
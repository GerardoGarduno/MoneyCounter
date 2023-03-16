// Get access to the user's webcam
navigator.mediaDevices.getUserMedia({ video: true })
  .then(function(stream) {
    var video = document.getElementById('video');
    video.srcObject = stream;
    video.play();
  })
  .catch(function(error) {
    console.log("Error getting user media: " + error.message);
  });

// Capture a frame from the webcam and send it to the server
var captureButton = document.getElementById('capture');
captureButton.addEventListener('click', function() {
  var video = document.getElementById('video');
  var canvas = document.createElement('canvas');
  canvas.width = video.videoWidth;
  canvas.height = video.videoHeight;
  var context = canvas.getContext('2d');
  context.drawImage(video, 0, 0, canvas.width, canvas.height);
  var dataUrl = canvas.toDataURL('image/jpeg');

  // TODO: Send the dataUrl to the server using an AJAX request
  console.log(dataUrl);
});

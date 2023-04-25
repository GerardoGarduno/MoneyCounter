import React, {useState, useCallback, useRef} from 'react';
import Webcam from "react-webcam";
import {useNavigate , BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import "./webPages.css";

function cameraPage(){
  const webcamRef = useRef(null);
  const [image,setImage] = useState(null);
  const [screenshot,setScreenShot] = useState(false); //possible bug multiple attendpt to sedn 
  const [uploading, setUploading] = useState(false);
  function handleUpload(event) {
      event.preventDefault();
      const formData = new FormData();
      const fileInput = document.querySelector('#file');
      if (!fileInput) {
        console.error('File input element not found');
        return;
      }
      const files = fileInput.files;
      for (let i = 0; i < files.length; i++) {
        formData.append('file', files[i]);
      }
      setUploading(true);
      fetch('http://localhost:5000/upload', {
        method: 'POST',
        body: formData
      }).then(response => {
        if (response.ok) {
          alert('Upload successful');
          fileInput.value = null; // reset the file input field
          //block the the upload data button while proccessing data
          setUploading(false);
        } else {
          alert('Upload failed');
          setUploading(false);
        }
      });
  }
  function sendimage(event) {
    event.preventDefault();
    if (image === null) {
      console.error('No image captured');
      return;
    }
    const formData = new FormData();
    const blob = new Blob([image], {type: 'image/jpeg'});
    formData.append('image', blob, 'image.jpg');
    fetch('http://localhost:5000/upload_image', {
      method: 'POST',
      body: formData
    }).then(response => {
      if (response.ok) {
        alert('Image uploaded successfully');
      } else {
        alert('Image upload failed');
      }
    }).catch(error => {
      console.error('Error uploading image:', error);
    });
  }
  
  const capture = useCallback(() =>{
    console.log("trying to camptr")
    const imageSrc = webcamRef.current.getScreenshot();
      setImage(imageSrc);
      console.log(imageSrc);
    },[webcamRef]);
    let navigate = useNavigate(); 
  const goHome = () =>{ 
      let path = '/'; 
      navigate(path);
  }
  return(
        <div>
          <div className="NavBar">
            <ul>
                <li className = "MoneyCounter" onClick={goHome} ><a>MoneyCounter</a></li>
            </ul>
          </div>
          <div className= "webstream">
            {image === null ? (
              <>
              <Webcam
              ref ={webcamRef}
                className="webcam"
                audio={false}
                screenshotFormat="image/jpeg"
            />
          <button className = "submit" onClick={capture}>Capture</button>
          </>
          ) : (
          <>  
            <img className = "webcam" src ={image} alt = "screenshot"/>
            <button className= "submit" onClick = {sendimage}>Send to Model</button>
            <button className="submit" onClick={() => setImage(null)}>Retake</button>            
          </>  
          )}
   
          </div>
          <form onSubmit={handleUpload} className = "form">
                <input id="file" type="file" name="file" multiple />
                <button className = "submit"  type="submit" disabled={uploading}>Upload</button>
          </form>  
  
        </div>
    )
}
export default cameraPage;
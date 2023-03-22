import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bills: [],
      total: null,
      uploading: false
    };
    this.handleUpload = this.handleUpload.bind(this);
  }

  componentDidMount() {
    this.getData();
  }

  getData() {
    fetch('http://localhost:5000/total')
      .then(response => response.json())
      .then(data => {
        this.setState({ total: data.total });
      });
  
    fetch('http://localhost:5000/bills')
      .then(response => response.json())
      .then(data => {
        this.setState({ bills: data.bills });
      });
  }

  handleUpload(event) {
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
  
    this.setState({ uploading: true });
    fetch('http://localhost:5000/upload', {
      method: 'POST',
      body: formData
    }).then(response => {
      if (response.ok) {
        alert('Upload successful');
        fileInput.value = null; // reset the file input field
        
        // fetch updated data after successful upload
        this.getData();
        
        this.setState({ uploading: false });
      } else {
        alert('Upload failed');
        this.setState({ uploading: false });
      }
    });
  }
  

render() {
    return (
      <div>
        <h1>Total Amount of Money:</h1>
        <h2>{this.state.total}</h2>
        <h1>Bills:</h1>
        <ul>
          {this.state.bills.map((bill, index) => (
            <li key={index}>
              {bill.label} - Confidence: {bill.confidence}
            </li>
          ))}
        </ul>
        <form onSubmit={this.handleUpload}>
          <input id="file" type="file" name="file" multiple />
          <button type="submit" disabled={this.state.uploading}>Upload</button>
        </form>
      </div>
    );
  }
}
export default App;

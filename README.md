# MoneyCounter
Application Identifies money and sum total

To run the program, follow these steps:
1) git clone https://github.com/GerardoGarduno/MoneyCounter
2) cd /MoneyCounter/backend
3) python is needed to run this program if python is not installed here is link to install python
  - a)Mac: https://docs.brew.sh/Homebrew-and-Python
  - b)Windows: https://learn.microsoft.com/en-us/windows/python/beginners 
4) pip install -r requirements.txt
6) python3 server.py -> the server will begin to call the roboflow api to begin analysis on the current jpeg images in the 'images' folder inside the backend directory.
7) open a new terminal and navigate to the front end cd /MoneyCounter/frontendReact
8) You will need to have node installed first
  - a)Mac: https://formulae.brew.sh/formula/node
  - b)Windows: https://nodejs.org/en/download
10) npm run dev -> press 'o' to open local port 
11) You should now have two terminal running 1] running the server and 2] running the frontend.




## **Showing the table before new dollar is added to wallet**
![first(showing table)](https://github.com/GerardoGarduno/MoneyCounter/assets/48225150/bafd751b-7a17-4591-b3f2-7d843dd70981)
## **Showing the camera sending image to roboflow api**
![PART2 AGAIN AGAIN](https://github.com/GerardoGarduno/MoneyCounter/assets/48225150/5d622b35-aba6-42ac-96d1-549afe71af93)
## **Showing the updated 'wallet' with the new total and new data from the new bill**
![part3(showing new table](https://github.com/GerardoGarduno/MoneyCounter/assets/48225150/4c315efd-c79b-4cdb-8ab8-731cd074ca7b)



# **Features:**
1) Uses machine learning to identify money​
2) Webcam or File Upload ​
3) Virtual wallet ​(Without Authentication)​
4) Use of interactive techniques​

# **Bonus Features:**
1) Text To speech​
2) Mobile/Web responsive ​
3) Sortable data

# **Future Features:**
1) need to add authentication
2) improve the model to be able to detect multiple bills from same images
3) serial number (avoid repetitions)

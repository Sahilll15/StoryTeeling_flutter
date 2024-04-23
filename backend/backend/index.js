const express=require('express')
const { GoogleGenerativeAI } = require('@google/generative-ai');
const cors = require("cors");

const app=express();
app.use(cors())
app.use(express.json())
app.use('/uploads', express.static('uploads'))


app.get('/',(req,res)=>{
    res.json({
        'server':'this is the backend of the storytelling application'
    })
})

app.listen(4000,()=>{
    console.log('server running on 4000')
})


let API_KEY = 'AIzaSyA0RhWRyVzHpJPwMhjrPwUtxyRmwOBp4hs'

const googleAI = new GoogleGenerativeAI(API_KEY);
const geminiConfig = {
  temperature: 0.9,
  topP: 1,
  topK: 1,
  maxOutputTokens: 4096,
};
 
const geminiModel = googleAI.getGenerativeModel({
  model: 'gemini-pro',
  geminiConfig,
});

const generate = async (req,res) => {
    let langauge='english'
    
console.log(req.body);
    let prompt=req.body.text;
    console.log(prompt)

    try {
      
      const result = await geminiModel.generateContent(prompt);
      const response = result.response;
    //   console.log(response.text());

    let text = prompt.toLowerCase().includes('monkey');

        res.send({
          text: response.text(),
          image:text ? '/upload/monkey.jpg':'/uploads/titanic.jpg'

        })
    } catch (error) {
      console.log('response error', error);

        res.send('error')
    }
  };
 

app.post('/askStory',generate)
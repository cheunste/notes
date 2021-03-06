# Nodejs Notes

## About

Nodejs uses chrome's Javascript V8 engine, so it is a prety big deal

## JSON

 * Stands for Javascript Object Notation
 * This is a format used to translate data. XML is another alternative. 
 * Contains keys and values and values can be any type like an int, boolean or even another object
 * Objects are denotated with Strings
 * WHen you're trying to read json from another website, it will become difficult to read
    * In that case, you can download a google chrome extension that will convert it to human readable format

 * Another good tool is Postman (google chrome extension). This allows you to make test requests from the browser and not in code

## Basics of Node

* The basic of node isn't really that useful. Its main power comes from the npm packages
* There are much more packages than you can imagine
* That being said, you will have to install npm...assuming it doesn't come with node


## Node MOdules

* You can create your own modules
* To make it usable for other files, use the 'export' keyword.

```javascript
var print= function(){}

module.exports = print;
```

* To import the module,  use a require
```javascript
var print = require('./print');
```

## Simple Node

* use npm init to create a package
* Use npm install --save express to install express. Note that it now shows up in the dependencies in the package.json and the directory have a packatgtes folder
    * using the --save makes sure the package is downloaded

* The following is a very very simple nodejs webserver

```javascript
var express = require('express');
var app = express();

/*
'/' is base URL
this means pass a request in

reequest comes from the licent

response is what you send back to the client

You ALWAYS send a response back becaues the client is always wiating

This listens for requets
*/
app.get('/',function(request,response){
    response.send("My first API");
});

app.get('/funions',function(req,res){
    response.send("Derp");
});

/*
This actually creates a server and listens on a port
*/
app.listen(3000,function(){
    console.log("First API running on port 3000");
});
```

* The above does the following:
    - app.get listens for a request coming into the server through the base URL. It **MUST** return a response
        - Note that the base URL does not have the forward slash (ie google.com vs google.com/)
    - app.listen is the part that actually creates the server.

    - response is what you _send_ to the client
    - request is what the client _sends_ to the server

## GET and POST Request

* A server is kinda limited if you can't have clients talk to it.
* You typically use a DB store client's data

* You can use an app called "Postman" to send requets to your server instead of interfacing with your browser. It is quite handy

```javascript
app.post('/',function(request,response){
    var ingredient = request.body;
    //Error chekcing
    if(!ingredient || ingredient.text ==""){
        response.status(500).send({error: "Your ingredient must have a name "});
    }
    else{
        ingredients.push(ingredient);
        res.status(200).send();
    }
});
```

* The above is a post request.
* Note that you can send the status code as part of the response

## PUT and DELETE Requests

* Use the app.put function
* Recall that PUT requests puts a file or resoruce at a speicfic URI

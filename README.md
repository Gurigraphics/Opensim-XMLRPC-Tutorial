# Opensim-XMLRPC-Tutorial
---

# RemoteAdmin example
---
---


## 0) Start server with -console rest
```
ulimit -s 1048576
mono --desktop -O=all OpenSim.exe -console rest
```

## 1) Edit file "MyWorld.ini"
```
[RemoteAdmin]
    enabled = true
    access_password = "password"
    enabled_methods = all

[XMLRPC]
    XmlRpcRouterModule = "XmlRpcRouterModule"
    XmlRpcPort = 20800
    XmlRpcHubURI = http://localhost:20800
```

## 2) File "index.html"
- Add "xmlrpc.js" 
- Add "main.js"

## 3) File "main.js"
### Try this examples

```js
var url = 'http://111.111.111.111:20800'
var methodName = 'admin_broadcast'
var params = { 
    message: 'the answer is 42',
    password: "password"
}

var rpc = new XmlRpc(url) 

rpc.onerror = function (e) {   
   console.log(e) 
}

rpc.call( methodName, params, function(response){
    console.log( response )    
})
```


---
# llRemoteData example

---
---
## 1) File "script.lsl"

- Add "script.lsl" to a object in World.

- Get the channel ID in chat
```
[14:42] Object: Ready to receive requests on channel "a76d1bd9-10e8-4b08-a25f-59fece3ce696"
```

## 3) File "main.js"
### Try this example
```js
var url = 'http://111.111.111.111:20800'
var channel = "3037ed7d-1111-1111-1111-274141f8fa1e"
var methodName = 'llRemoteData'
var params = { 
    IntValue: 123,
    StringValue: 'Hello, world!',
    Channel: channel
}

var rpc = new XmlRpc(url) 

rpc.onerror = function (e) {   
   console.log(e) 
}

rpc.call( methodName, params, function(response){
    console.log( response )    
}) 
```

---
# Nodejs example
---
---
## 1) Create a project
```
npm init -y
```

## 2) Install xmlrpc
```
npm i xmlrpc
```

## 3) File "main.js"

```js
const xmlrpc = require('xmlrpc')

var client = xmlrpc.createClient({
  host: 'localhost',
  port: 9000
});

var call = (method, params) => {
  client.methodCall(method, [params], function(error, value) {
    console.log( value );
    console.log( error );
  });
}

var method = 'admin_console_command'
var params = {
  password: "password",
  command: 'change region MyRegion'
} 

call(method, params)
```

## 4) Run
```
node main.js
```
---
# References
---
---
### All methods RemoteAdmin.json
https://github.com/MarcelEdward/OpenSim-RemoteAdmin/blob/c72d5e43d331729527d2a919c712de5a13575f0d/RemoteAdmin.json

### Server commands
http://opensimulator.org/wiki/Server_Commands

### Second life scripts
https://wiki.secondlife.com/wiki/Category:LSL_XML-RPC

### RemoteAdmin:admin authenticate user
http://opensimulator.org/wiki/RemoteAdmin:admin_authenticate_user

###  RemoteAdmin:RemoteAdmin Examples
http://opensimulator.org/wiki/RemoteAdmin:RemoteAdmin_Examples

###  RemoteAdmin:RemoteAdmin Class
http://opensimulator.org/wiki/RemoteAdmin:RemoteAdmin_Class





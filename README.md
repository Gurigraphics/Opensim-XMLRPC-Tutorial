# Opensim-XMLRPC-Tutorial

# RemoteAdmin example

## 1) Edit file "MyWorld.ini"
```
[RemoteAdmin]
    access_password = "password"
    enabled_methods = all

[XMLRPC]
    XmlRpcRouterModule = "XmlRpcRouterModule"
    XmlRpcPort = 20800
    XmlRpcHubURI = http://localhost:20800
```

## 2) File "index.html"
- Add "jquery"
- Add "jquery.xmlrpc"
- Add "xmlrpc.js" 
- Add "main.js"

## 3) File "main.js"
### Try this examples

```js
const rpc = new Xmlrpc({
  url: "http://localhost:9000/",
  password: "secret"
})

// admin_broadcast example
rpc.sendCommand({
  methodName: 'admin_broadcast',
  params: { message: 'the answer is 42' }
}).then(function(result){
  console.log( result[0] )
})

//admin_console_command example
/*
rpc.sendCommand({
  methodName: 'admin_console_command',
  params: { 
    command: 'show uptime' 
  }
}).then(function(result){
  console.log( result[0] )
})
*/
```

# llRemoteData example

## 1) File "script.lsl"

- Add "script.lsl" to a object in World.

- Get the channel ID in chat
```
[14:42] Object: Ready to receive requests on channel "a76d1bd9-10e8-4b08-a25f-59fece3ce696"
```

## 3) File "main.js"
### Try this example
```js
const llRemoteData = new Xmlrpc({
  url: "http://localhost:20800",
  channel: "a76d1bd9-10e8-4b08-a25f-59fece3ce696"
})

llRemoteData.sendCommand({
  methodName: 'llRemoteData',
  params: { 
    IntValue: 425,
    StringValue: 'Hello, world!'
  }
}).then(function(result){
  console.log( result[0]  )
})
```


# Nodejs example

## 0) Create a project
```
npm init -y
```

## 1) Install xmlrpc
```
npm i xmlrpc
```

## 2) File "main.js"

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

## 3) Run
```
node main.js
```

# References

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





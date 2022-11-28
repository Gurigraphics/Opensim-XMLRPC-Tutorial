const rpc = new Xmlrpc({
  url: "http://localhost:9000/",
  password: "password"
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

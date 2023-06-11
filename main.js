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

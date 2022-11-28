function Xmlrpc( data ){
  
  this.url = data.url;
  this.channel = data.channel
  this.password = data.password

  this.sendCommand = ( data, response = { Channel: this.channel } ) => {  
    
    if( this.password ){  
      response = {
        password: this.password
      } 
    }

    return new Promise(( resolve, reject ) => {
      $.xmlrpc({
        url: this.url,
        methodName: data.methodName,
        params: [ { ...response, ...data.params }],
        success: function(response, status, jqXHR){       
          resolve( response )    
        },
        error: function(jqXHR, status, error) { 
          reject( error )
        }
      })
    })
  } 
}

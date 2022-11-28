
key remoteChannel;

init() {
    llOpenRemoteDataChannel(); // create an XML-RPC channel
    llOwnerSay("My key is " + (string)llGetKey());
}

request( key channel, key message_id, string sender, integer ival, string sval ){    
      llOwnerSay("I just received data in "+ llGetRegionName() + 
                        " at position " + (string)llGetPos() + "\n" +
                        "The channel was " +  (string)channel + "\n" +
                        "The message_id was " + (string)message_id + "\n" +                  
                        "The string was " +  sval + "\n" +
                        "The number was " + (string)ival + ".");
                    
   response( channel, "I got it", 9000 );
}                                
 
response( key channel, string sval, integer ival ) {
  llRemoteDataReply(channel,NULL_KEY,"I got it",2008);
}  

default {
    state_entry() {
        init();
    }
    
    state_exit() {
        return;
    }
                                
    on_rez(integer param) { 
        llResetScript();        
    }
                                
    remote_data(integer type, key channel, key message_id, string sender, integer ival, string sval ) {
         if (type == REMOTE_DATA_CHANNEL) { // channel created
             /*
             llSay(DEBUG_CHANNEL,"Channel opened for REMOTE_DATA_CHANNEL" + 
                (string)channel + " " + (string)message_id + " " + (string)sender + " " +                         
                (string)ival + " " + (string)sval);
             remoteChannel = channel;
             */            
             llOwnerSay("Ready to receive requests on channel \"" + (string)channel + "\"");                        
             state receiving; // start handling requests
         } else {
             llSay(DEBUG_CHANNEL,"Unexpected event type"); 
         }                      
     }                 
}      

state receiving {

    state_entry() {
        llOwnerSay("Ready to receive information from outside SL");
    }  
    
    state_exit() {
        llOwnerSay("No longer receiving information from outside SL.");
        llCloseRemoteDataChannel(remoteChannel);
    }
    
    on_rez(integer param) {
        llResetScript();
    }
    
    remote_data(integer type, key channel, key message_id, string sender, integer ival, string sval) {
        if (type == REMOTE_DATA_REQUEST) { // handle requests sent to us                       
            request( channel, message_id, sender, ival, sval );   
        }
    }
} 

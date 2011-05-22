//= require <jquery.ui>

jQuery(function($){
  if (typeof Juggernaut == "undefined") return;
  
  var JuggernautApp = Spine.Class.create({
    init: function(){
    	console.log('ok');
      this.socket = new Juggernaut({host: 'ishootstuff.net', port:4747});
      this.offline = $("<div></div>")
    		.html("The connection has been disconnected! <br /> " + 
    		      "Please go back online to use this service.")
    		.dialog({
    			autoOpen: false,
    			modal:    true,
    			width:    330,
    			resizable: false,
    			closeOnEscape: false,
    			title: "Connection"
    		});
    		
    	this.proxyAll("connect", "disconnect", "reconnect", "process");
  
    	this.socket.on("connect", this.connect);
    	this.socket.on("disconnect", this.disconnect);
    	this.socket.on("reconnect", this.reconnect);
    	this.socket.subscribe("/observer", this.process);
    	
    	$("body").bind("ajaxSend", this.proxy(function(e, xhr){
        xhr.setRequestHeader("X-Session-ID", this.socket.sessionID);
      }));
    },
    
    connect: function(){
      this.log("connected");
      this.offline.dialog("close");
    },
    
    disconnect: function(){
      this.offline.dialog("open");
      this.log("disconnected")
    },
    
    reconnect: function(){
      this.log("reconnecting");
    },
    
    process: function(msg){
      Spine.Model.noSync(this.proxy(function(){
        this.processWithoutSync(msg);
      }));
    },
    
    processWithoutSync: function(msg){
      this.log("process", msg);
      
      var klass = eval(msg.klass);
      
      switch(msg.type) {
        case "create":
          if ( !klass.exists(msg.record.id) )
            klass.create(msg.record);
          break;
        case "update":
          klass.update(msg.id, msg.record);
          break;
        case "destroy":
          klass.destroy(msg.id);
          break;
        default:
          throw("Unknown type:" + type);
      }
    }
  });
  
  // Add logging
  JuggernautApp.include(Spine.Log);
  JuggernautApp.fn.logPrefix = "(Juggernaut)";

  window.App.Juggernaut = JuggernautApp.init();
});
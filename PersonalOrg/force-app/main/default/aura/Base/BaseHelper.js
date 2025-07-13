({
	callServer : function(component,method,callback,params) {
        var action = component.get(method);
        if(params)
        {
           action.setParams(params); 
        }
		action.setCallback(this,function(response){
         var state = response.getState();
         if (state == "SUCCESS")
            {
             callback.call(this,response.getReturnValue());
            }	
        else if (state == "Error")
            {
            var errors = response.getError();
                if(errors){
                    //console.log("Error"errors);
                    if(errors[0] && error[0].message)
                    {
                        throw new Error("Error"+error[0].message);
                    }else{
                        throw new Error("Unknown Error");
                    }
                }
            }
    });
        $A.enqueueAction(action);
	}
                
})
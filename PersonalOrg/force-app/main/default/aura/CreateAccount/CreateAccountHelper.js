({
	createNewAccount : function(component) {
      //  alert('Name: ' + component.find("inputName").get("v.value") +'Phone: ' + "v.newPhone" +'Year: ' + "v.newYear");
        var action = component.get('c.newAccount');
        action.setParams({ "accName" : component.find("inputName").get("v.value"),
                           "accPhone" : component.find("inputPhone").get("v.value"),
                          "accYear" : component.find("inputYear").get("v.value")
                         });

        //callback
        
       action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.newResult', a.getReturnValue());
               //alert("New Account created Succesfully");
            }
        });
        $A.enqueueAction(action);      
		//alert("New button was Fired");
	}
})
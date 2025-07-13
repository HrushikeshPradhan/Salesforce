({
    doInit : function(component, event, helper) {
        var createCarRecord = $A.get("e.force:createRecord");
        if(createCarRecord){
            component.set("v.showNew",true);
        }else{
            component.set("v.showNew",false);
        }
        
      helper.getCarType(component,helper);
		},
	onSearchClick : function(component, event, helper) {
        helper.handelonSearchClick(component, event, helper);
		},
    
    newValueSelected : function(component, event, helper) {
        var carTypeId = component.find("carTypeList").get("v.value");
        alert(carTypeId+' Option Selected');
		},
    createRecord :function(component, event, helper) {
        var createCarRecord = $A.get("e.force:createRecord");
        createCarRecord.setParams({"entityApiName":"Car__c"	});
        createCarRecord.fire();
        
    }

})
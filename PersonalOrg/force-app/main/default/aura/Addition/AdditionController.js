({
	AddNumbers : function(component, event, helper) {
        var result = component.find("inputNumber1").get('v.value')+component.find("inputNumber2").get('v.value');
        component.set('v.newResult',result);
	}
})
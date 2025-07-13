public class webCallout {
    
    @AuraEnabled(cacheable=true)
    public static webCalloutResponseWrapper getResponse() {
        String endpointUrl = 'callout:pipedream'; // Retriving Url and Auth. details from Named Credential
        webCalloutResponseWrapper resWrap = new webCalloutResponseWrapper();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpointUrl);
        req.setMethod('GET');
        
        Http http = new Http();
        
        try {
            HttpResponse response = http.send(req);
            if (response.getStatusCode() == 200) {
                String responseBody = response.getBody();
                resWrap = (webCalloutResponseWrapper) JSON.deserialize(responseBody, webCalloutResponseWrapper.class);
            } else {
                System.debug('HTTP Response Status: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            System.debug('HTTP Callout failed: ' + e.getMessage());
        }
        return resWrap;
    }
}
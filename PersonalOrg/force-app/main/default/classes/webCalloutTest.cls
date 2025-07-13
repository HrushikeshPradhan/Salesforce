@isTest
public class webCalloutTest {
    
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"success": true}');
            return res;
        }
    }
    
    private class FailingHttpMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            throw new CalloutException('Callout failure');
        }
    }
    
    @isTest
    static void testSuccessResponse() {
        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        webCalloutResponseWrapper resWrap = new webCalloutResponseWrapper();
        resWrap = webCallout.getResponse();
        
        System.assertEquals(true, resWrap.success);
    }
    
    @isTest
    static void testFailureResponse() {
        Test.setMock(HttpCalloutMock.class, new FailingHttpMock());
        
        webCalloutResponseWrapper resWrap = new webCalloutResponseWrapper();
        resWrap = webCallout.getResponse(); 
        
        System.assertEquals(null, resWrap.success);
    }
    
}
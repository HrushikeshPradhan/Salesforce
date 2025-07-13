@isTest
public class bbcTest {

   // Mock HTTP Response class for Success and Failure Scenario.
   
   private class MockHttpResponseGenerator implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('<html><body>' +
                '<div data-testid="illinois-grid-10">' +
                '<div>' +
                '<div data-testid="card-order">1</div>' +
                '<a data-testid="internal-link" href="/news/article1">Article 1</a>' +
                '<h2 data-testid="card-headline">Title 1</h2>' +
                '</div>' +
                '<div>' +
                '<div data-testid="card-order">2</div>' +
                '<a data-testid="internal-link" href="/news/article2">Article 2</a>' +
                '<h2 data-testid="card-headline">Title 2</h2>' +
                '</div>' +
                '</div>' +
                '</body></html>');
            return res;
        }
    }
 
   private class MockHttpFailureResponseGenerator implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(500);
            res.setBody('Internal Server Error');
            return res;
        }
    }
  
   private class FailingHttpMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            throw new CalloutException('Simulated callout failure');
        }
    }

   //Test Coverage for success scenario.
    
    @isTest
    static void testMostReads() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Map<String, String>> articles = bbc.mostReads();
        
        System.assertNotEquals(null, articles);
        System.assertEquals(2, articles.size());
    }

    //Test Coverage for failure scenarios.
    
    @isTest
    static void testMostReadsHttpFailure() {
        Test.setMock(HttpCalloutMock.class, new MockHttpFailureResponseGenerator());

        List<Map<String, String>> articles = bbc.mostReads();
        System.assertNotEquals(null, articles);
        System.assertEquals(0, articles.size());
    }

    @isTest
    static void testMostReadsFailingResponse() {
 		Test.setMock(HttpCalloutMock.class, new FailingHttpMock());

        List<Map<String, String>> articles = bbc.mostReads();
        System.assertNotEquals(null, articles);
        System.assertEquals(0, articles.size()); 
    }
}
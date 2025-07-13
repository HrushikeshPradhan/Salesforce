public class bbc {
    
    private static final String endpoint = 'https://www.bbc.com/news';
    private static final String sectionNodeTestId = 'illinois-grid-10';
    private static final String urlNodeTestId = 'internal-link';
    private static final String titleNodeTestId = 'card-headline';
    private static final String orderNodeTestId = 'card-order';
    private static final String urlDomain = 'https://www.bbc.com';
  
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> mostreads() {
        List<Map<String, String>> articles = new List<Map<String, String>>();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res;
        
        try {
            res = http.send(req);
        } catch (Exception e) {
            System.debug('HTTP Request failed: ' + e.getMessage());
            return articles; // Return empty list on failure
        }
        
        if (res.getStatusCode() == 200) {
                String responseBody = res.getBody();
                Dom.Document doc = new Dom.Document();
                doc.load(responseBody);
                Dom.XMLNode rootNode = doc.getRootElement();
                Dom.XMLNode sectionNode = findNode(rootNode, sectionNodeTestId);
                
                if (sectionNode != null) {
                    List<Dom.XMLNode> cardNodes = sectionNode.getChildElements();
                    
                    for (Dom.XMLNode cardNode : cardNodes) {
                        Dom.XMLNode urlNode = findNode(cardNode, urlNodeTestId);
                        Dom.XMLNode headlineNode = findNode(cardNode, titleNodeTestId);
                        Dom.XMLNode articleIdNode = findNode(cardNode, orderNodeTestId);
                        
                        if (urlNode != null && headlineNode != null && articleIdNode != null) {
                            String articleUrl = urlDomain + urlNode.getAttributeValue('href', null);
                            String articleTitle = headlineNode.getText();
                            String articleId = articleIdNode.getText();
                            
                            Map<String, String> articleDetails = new Map<String, String>();
                            articleDetails.put('title', articleTitle);
                            articleDetails.put('url', articleUrl);
                            articleDetails.put('articleId', articleId);
                            articles.add(articleDetails);
                        }
                    }
                } else {
                    System.debug('Section node not found');
                }
        } else {
            System.debug('HTTP Request failed with status: ' + res.getStatusCode());
        }
        System.debug('Articles:'+articles);
        return articles;
    }
    
    public static Dom.XMLNode findNode(Dom.XMLNode node, String testId) {
        if (node.getAttributeValue('data-testid', null) == testId) {
            return node;
        }
        
        for (Dom.XMLNode child : node.getChildElements()) {
            Dom.XMLNode foundNode = findNode(child, testId);
            if (foundNode != null) {
                return foundNode;
            }
        }
        return null;
    }
}
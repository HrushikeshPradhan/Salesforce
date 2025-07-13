@isTest
public class TestCreateOppty {
/*    public static testMethod void newOpptyValid(){
        Account a = new Account(Name = 'Burlington Acme');
        insert a;
        Case c = new Case(AccountId = a.Id);
        insert c;        
        String oppName = 'Burlington Acme 1000 TVs';
        
        List<Opportunity> lob = [SELECT Name, AccountId, StageName, CloseDate From Opportunity];
        System.assertEquals(0, lob.size());
        CreateOppty.newOppty(oppName, c.id);
        List<Opportunity> lo = [SELECT Name, AccountId, StageName, CloseDate From Opportunity];
        System.assertEquals(1, lo.size());
        System.assertEquals(lo[0].Name, oppName);
        System.assertEquals(lo[0].AccountId, a.Id);
        System.assertEquals(lo[0].StageName, 'Perception Analysis');
        System.assertEquals(lo[0].CloseDate, Date.today().addMonths(1));
    } */
        
    public static testMethod void newLeadCreation (){
        // Creating a new Lead
        Lead newLead = new Lead(
            FirstName = 'John',
            LastName = 'DoeOne',
            Company = 'Doe Enterprises',
            Email = 'johndoe@example.com',
            Status = 'Open - Not Contacted'
        );
        
        // Insert the Lead record
        insert newLead;
        
        // Use Test.startTest() and Test.stopTest() to ensure any async processes are completed.
        Test.startTest();
        Test.stopTest();
        
        // Define the search term
        String searchTerm = 'Doe Enterprises'; // Use Company Name to ensure a broader search
        
        // Perform SOSL search
        List<List<SObject>> searchResults = [FIND :searchTerm IN ALL FIELDS RETURNING Lead(Id, FirstName, LastName, Company, Email)];
        
        // Debugging output
        System.debug('Search Term: ' + searchTerm);
        System.debug('Search Results: ' + searchResults);
        
        // Check if any results were found
        if (!searchResults.isEmpty() && !searchResults[0].isEmpty()) {
            // Cast the result to Lead
            Lead foundLead = (Lead)searchResults[0][0];
            System.debug('Lead found: ' + foundLead.FirstName + ' ' + foundLead.LastName + ' with Company: ' + foundLead.Company);
        } else {
            System.debug('No Lead found for the search term: ' + searchTerm);
        }
        
        // Assert that the Lead was found
        System.assert(!searchResults.isEmpty() && !searchResults[0].isEmpty(), 'Lead should be found in SOSL search.');
    }
}
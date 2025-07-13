public class CreateNewAccount {
    @AuraEnabled 
    public static string newAccount(string accName, string accPhone,string accYear) {
        
        //Establish Webservice Connection
        partnerSoapSforceCom.Soap mypartnerSoap= new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult partnerLoginResult = mypartnerSoap.Login('hrushikesh.pradhan@infosys.com','Rocky@1234eKYUYR3aKP3pxue9jXm0HyP5');
        System.debug('Login Result ---->' + partnerLoginResult);
        System.debug('Session Id ---->' + partnerLoginResult.sessionId);
        
        string sessionId = partnerLoginResult.sessionId;
        soapSforceComSchemasClassCreateacco.SessionHeader_element objSessionHeader = new soapSforceComSchemasClassCreateacco.SessionHeader_element();
        objSessionHeader.sessionId = sessionId;
        
        soapSforceComSchemasClassCreateacco.CreateAccountWS createAcc= new soapSforceComSchemasClassCreateacco.CreateAccountWS();
        createAcc.SessionHeader = objSessionHeader;
        string status = createAcc.createAccount(accName,accYear,accPhone);
        
        /*
        soapSforceComSchemasClassCreateacco.CreateAccountWS createAcc= new soapSforceComSchemasClassCreateacco.CreateAccountWS();
        createACC.SessionHeader = new soapSforceComSchemasClassCreateacco.SessionHeader_element();
        createACC.endpoint_x = 'callout:Requestor';
        createAcc.SessionHeader.sessionId = '{!$Credential.OAuthToken}';
        string status = createAcc.createAccount('Testing04','2020','9878987890'); */
        
        string statusMsg = '';
        System.debug('Name: ' + accName);
        System.debug('Phone: ' + accPhone);
        System.debug('Year: ' + accYear);
        Account newAcc = new Account(Name=accName, 
                                             YearStarted = accYear,
                                             Phone = accPhone);
        
        if(status == 'success')
        {
            insert newAcc;
        }
        if(newAcc.Id != Null)
        {
            statusMsg ='Record Created Successfully .....';
        }
        else
        {
            statusMsg ='Record Creation Failed....';
        }

       //    insert newAcc;
        return statusMsg;
    }
}
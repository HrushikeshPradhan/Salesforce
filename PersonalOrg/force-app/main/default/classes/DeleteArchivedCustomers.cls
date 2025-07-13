public class DeleteArchivedCustomers {
	
    public class outputVariables{
    @InvocableVariable 
    public List<Account> archivedAccountList;
    }

    @InvocableMethod(label='Archived Customer' description='Returns the list of archived customer since dynamic input years parameter.')
    public static List<outputVariables> deleteAccount(List<Integer> nYears) {
        outputVariables outputVar = new outputVariables();
        List<outputVariables> listOutputVar = new List<outputVariables>();
        outputVar.archivedAccountList = Database.query('SELECT Id, Name, Archived_On__c, IsArchived__c, IsDeleted FROM Account WHERE Archived_On__c > LAST_N_YEARS:' + nYears[0] + 'ALL ROWS');
        listOutputVar.add(outputVar);
        System.debug(listOutputVar);
        return listOutputVar;
    }
      
}
trigger AccountTriggerHandler on Account (before delete) {
    
    List<contact> Contacts = [select accountid from contact where accountid in : Trigger.oldMap.keySet()];
    set<id> accIds=new set<id>();
    for(contact con: Contacts)
        accIds.add(con.accountid);
    
    for(account acc:trigger.old)
        if(accIds.contains(acc.id))
        acc.adderror('******* Contact is associated with it.you cant delete account');            
}
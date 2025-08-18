public with sharing class MyContactListController {
   @AuraEnabled (cacheable=true)
   public static List<Contact> getContacts(Integer offset, Integer limitSize) {
      List<Contact> contacts = new List<Contact>();
      if (Schema.sObjectType.Contact.isAccessible()) {
         contacts = [SELECT Id, FirstName, LastName FROM Contact LIMIT :limitSize OFFSET :offset];
      }
      return contacts;
   }
}
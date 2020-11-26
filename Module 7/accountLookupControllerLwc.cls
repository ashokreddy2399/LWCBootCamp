public with sharing class accountLookupControllerLwc {
    
    //Account Search method
    @AuraEnabled(cacheable=true)
    public static List<account> getAccounts(String accName) {
        String KeyString = '%' + accName + '%';
        return [select Id, Name, AccountNumber, Type, AnnualRevenue, Industry, (select Id, name, Title, Email, Phone from Contacts) from Account where Name like:KeyString];
    }
}

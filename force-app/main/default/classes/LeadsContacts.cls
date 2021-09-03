public with sharing class LeadsContacts {

    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads() {
        return [SELECT Id, Name, Title, Phone FROM Lead];
    }

    @AuraEnabled(cacheable=false)
    public static List<Lead> recordChange(Lead newRecord) {
        
        String id = newRecord.Id;
        String title = newRecord.Title;
        String phone = newRecord.Phone;
        
        List<Lead> recordForChange = [SELECT Id, Name FROM Lead WHERE Id = :id];
        recordForChange[0].Title = title; 
        recordForChange[0].Phone = phone;
        if(!recordForChange.isEmpty()){
            update recordForChange;
        } else {
            System.debug('something wrong' + recordForChange);
        }
        return recordForChange;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, Name FROM Contact];
    }
}

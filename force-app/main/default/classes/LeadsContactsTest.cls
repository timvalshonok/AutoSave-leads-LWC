@isTest
private class LeadsContactsTest {
    
    @isTest public static void checkGetLeads() {
        List<Lead> lead = new List<Lead>();
        lead.add(new Lead(Title = 'Test', Phone = '12345678', LastName = 'Test', Company = 'Test'));
        insert lead;

        Test.startTest();
        List<Lead> actual = LeadsContacts.getLeads();
        Test.stopTest();

        List<Lead> expected = [SELECT Id, Name, Title, Phone FROM Lead];

        System.assertEquals(expected, actual);
    }

    @isTest public static void checkRecordChangePositive() {
        Lead lead = new Lead(Title = 'Test', Phone = '12345678', LastName = 'Test', Company = 'Test');
        insert lead;
        Lead changedLead = new Lead(
            Id = lead.Id,
            Title = 'Tset',
            Phone = '87654321');

        Test.startTest();
        list<Lead> actual = LeadsContacts.recordChange(changedLead);
        Test.stopTest();
        
        List<Lead> expected = [SELECT Id, Name, Phone, Title FROM Lead];
        System.assertEquals(expected, actual);
    }

    @isTest public static void checkGetContacts() {
        List<Contact> contact = new List<Contact>();
        contact.add(new Contact(FirstName = 'Test', LastName = 'Test'));
        insert contact;

        Test.startTest();
        List<Contact> actual = LeadsContacts.getContacts();
        Test.stopTest();

        List<Contact> expected = [SELECT Id, Name FROM Contact];
        System.assertEquals(expected, actual);
    }
}

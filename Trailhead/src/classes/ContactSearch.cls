public class ContactSearch {
    public static List<Contact> searchForContacts(String lastNameFieldValue, String mailingPostalCodeFieldValue) {
        List<Contact> listOfContacts = [SELECT Id, Name FROM Contact where LastName = :lastNameFieldValue AND MailingPostalCode = :mailingPostalCodeFieldValue];
        
        return listOfContacts;
    }
}
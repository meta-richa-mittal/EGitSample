public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer noOfContacts, String lastName) {
        List<Contact> contactList = new List<Contact>();
        for(Integer i = 0; i< noOfContacts; i++) {
            Contact c = new Contact();
            c.FirstName = 'FirstName' + i;
            c.LastName = lastName;
            contactList.add(c);
        }
        return contactList;
    }

}
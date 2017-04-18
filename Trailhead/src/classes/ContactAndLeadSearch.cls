public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String textToSearch) {
        List<List<SObject>> searchedResults = [FIND :textToSearch IN NAME FIELDS RETURNING Contact(FirstName, LastName) , Lead(FirstName, LastName)];
        return searchedResults;
    }
}
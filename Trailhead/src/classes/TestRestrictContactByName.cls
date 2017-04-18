@isTest
private class TestRestrictContactByName {
	
    @isTest static void TestRestrictContactByNameWithLastNameInvalid() {
        Contact c = new Contact();
    	c.FirstName  = 'Abc';
    	c.LastName  = 'INVALIDNAME';
    	//insert c;
        
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assertEquals(1, result.getErrors().size());
    }
}
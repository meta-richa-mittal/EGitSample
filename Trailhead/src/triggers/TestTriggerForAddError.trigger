trigger TestTriggerForAddError on Account (before insert) {
    Integer custCount = 0;
    Integer vendorCount = 0;
    List<sObject> typeCountList = Database.query('select AccountType__c, COUNT(Name) acc_count from Account group by AccountType__c');
		for(sObject obj : typeCountList) {
            if(obj.get('AccountType__c') == 'customer')	{
				custCount = Integer.valueOf(obj.get('acc_count'));
				
			}else if(obj.get('AccountType__c') == 'vendor')	{
				vendorCount = Integer.valueOf(obj.get('acc_count'));
			}
       }
    List<Account> listToInsert = new List<Account>();
    for(Account sNew : trigger.new) {
        if(sNew.AccountType__c == 'customer')	{
			custCount++;
			sNew.AccountIdForType__c = 'CUST-'+custCount;	
		}else if(sNew.AccountType__c == 'vendor')	{
			vendorCount++;
			sNew.AccountIdForType__c = 'VEN-'+vendorCount;
		}
    }

}
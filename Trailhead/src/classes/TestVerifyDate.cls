@isTest
private class TestVerifyDate {
    
    @isTest static void checkDatesBetweenRangeTest() {
        Date firstDate = Date.newInstance(2012, 11, 12);
		Date secondDate = Date.newInstance(2012, 12, 8);
    	Date dateToReturn = VerifyDate.CheckDates(firstDate, secondDate);
        System.assertEquals(secondDate, dateToReturn);
	}
    
    @isTest static void checkDatesNotBetweenRangeTest() {
        Date firstDate = Date.newInstance(2006, 12, 2);
		Date secondDate = Date.newInstance(2012, 12, 8);
        Integer totalDays = Date.daysInMonth(firstDate.year(), firstDate.month());
    	Date dateToReturn = VerifyDate.CheckDates(firstDate, secondDate);
        System.assertEquals(Date.newInstance(firstDate.year(), firstDate.month(), totalDays), dateToReturn);
	}
}
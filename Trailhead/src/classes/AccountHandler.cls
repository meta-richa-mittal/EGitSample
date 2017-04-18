public class AccountHandler {
    public static Account insertNewAccount(String nameOfAccount) {
        try {
            Account accountToInsert = new Account(Name = nameOfAccount);
            insert accountToInsert;
            return accountToInsert;
        } catch(DMLException de) {
            return null;
        }
    }
}
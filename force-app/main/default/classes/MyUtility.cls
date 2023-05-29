public class MyUtility {
    public static Integer checkAge(String dob){
        Integer age;
        Date dt = Date.parse(dob);
        Integer days = dt.daysBetween(Date.today());
        age = Integer.valueOf(days/365);
        return age;
    }
    
    
    @AuraEnabled
    public static Map<String, String> getLastAccount(){
        Map<String, String> MAP_ACC_NAME = new Map<String, String>();
        for(Account acc : [SELECT id, Name FRom Account LIMIT 3]){
            MAP_ACC_NAME.put(acc.id, acc.Name);
        }
        return MAP_ACC_NAME;
    }


    @AuraEnabled
    public static void deleteContactRecord( String json){
        try {
            System.debug(' Json ???'+json);
            if(String.isNotBlank( json)) {
                List<Contact> listOfContact = (List<Contact>)System.JSON.deserialize(json,List<Contact>.class);
                System.debug('listOfContact >> '+listOfContact);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
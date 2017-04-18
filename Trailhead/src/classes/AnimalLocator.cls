public With Sharing class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest hReq = new HttpRequest();
        hReq.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        hReq.setMethod('GET');
        HttpResponse hRes = http.send(hReq);
        Map<String, Object> animalFeatures = new Map<String, Object>();
        if (hRes.getStatusCode() == 200) {
            System.debug(hRes.getBody());
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(hRes.getBody());
            Object animal = results.get('animal');
            System.debug(animal);
            animalFeatures = (Map<String, Object>) animal;
            System.debug(animalFeatures);
            
        }
        System.debug((String)animalFeatures.get('name'));
        return (String)animalFeatures.get('name');
    }
}
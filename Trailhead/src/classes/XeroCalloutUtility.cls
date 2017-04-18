public with sharing class XeroCalloutUtility {
       public static String EndPointURL = 'https://api.xero.com/api.xro/2.0/';
       public static String ConsumerKey = 'WOWHKV5XYMEQZYUF277QY3GNPF3NNL';
       public static String ConsumerSecret = '2T26ARDMQOLW13VSF7QO4HYSBMHILQ';
     
    /*public static Xero_Settings__c xeroSettings {

        get {

            if (xeroSettings == null) {
                
                xeroSettings = Xero_Settings__c.getInstance();
            }
            return xeroSettings;
        }
        set;
    }*/
    
    
    
    public static HttpResponse executeCallout (String method, String resourceName, String requestBody) {

        // Instantiate a new request
        HttpRequest request = new HttpRequest();

        // Set request parameters
        request.setMethod(method);
        request.setEndpoint(EndPointURL + resourceName);

        // Accept a JSON response from the call
        request.setHeader('Accept', 'application/json');

        // If the callout includes a body (POST and PUT requests)
        if (String.isNotBlank(requestBody)) {

            // Set the body to the callout
            request.setBody(requestBody);

            // Set the content to XML
            request.setHeader('Content-Type', 'text/xml');
        }

        // Sign the request based on OAuth 1.0a
        request = XeroOAuthUtility.signRequest(request, ConsumerKey );

        // Execute callout and return
        return new Http().send(request);
    }

}
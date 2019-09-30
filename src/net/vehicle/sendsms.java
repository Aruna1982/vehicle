package net.vehicle;
import java.net.*; 
import java.io.*; 

public class sendsms {
 

    public static String server;
    public static String user;
    public static String password;
    public static String phonenumber;
    public static String text;
    public static String data;
    public static String udh;
    public static String pid;
    public static String dcs;
    public static String sender;
    public static String validity;
    public static String servicetype;
    public static String smscroute;
    public static String receiptrequested;
    public static String sourceport;
    public static String destport;
    public static String delayuntil;
    public static String voicemail;
    public static String wapurl;
    public static String wapsl;

    public static String url_str;

    public static void smsmain(String phoneno,String logid,String task){
      sendsms.init();
      sendsms.server = "http://127.0.0.1:8800/";
      sendsms.user = "arunasanjeewa08@gmail.com";
      sendsms.password = "vidudine@1234";
      sendsms.phonenumber = "+94" +phoneno;
      //SMS Messages
      if (task == "Reg") sendsms.text = "Thank You for Registering with us. Your Login Name is "+logid+".";
      if (task == "ABok") sendsms.text = "Your Booking is Confirmed and Bookig Id is "+logid+". We will contact you from a short while. Thank You..";
      if (task == "PBok") sendsms.text = "Your Bookig Id is "+logid+". We will contact and Confirm before 02 Hours due to fully booked schedule. Thank You..";
      if (task == "RBok") sendsms.text = "Your Bookig Id is "+logid+". We will contact and confirm. Thank You..";
      sendsms.send();
    }
            
    
    public static void init () {
        server = null;
        user = null;
        password = null;
        phonenumber = null;
        text = null;
        data = null;
        udh = null;
        pid = null;
        dcs = null;
        sender = null;
        validity = null;
        servicetype = null;
        smscroute = null;
        receiptrequested = null;
        sourceport = null;
        destport = null;
        delayuntil = null;
        voicemail = null;
        wapurl = null;
        wapsl = null;
    }

    public static void setvar (String argname, String argvalue) {

       if (argname != null) {
          if (argvalue != null) {
             url_str = url_str + "&" + argname + "=";
             try {
                String encoded = URLEncoder.encode (argvalue, "UTF-8");
                url_str = url_str + encoded;
             }
             catch (UnsupportedEncodingException e) {
                url_str = url_str + argvalue;
             }
          }
       }
           
    }

    public static String send () {


       String returnstring;
   
       returnstring = null;

       if (server == null) {
  	  System.out.println("sendsms.server value not set");
          return returnstring;
       }

       url_str = server + "?";
       setvar("user", user);
       setvar("password", password);
       setvar("phonenumber", phonenumber);
       setvar("text", text);
       setvar("data", data);
       setvar("udh", udh);
       setvar("pid", pid);
       setvar("dcs", dcs);
       setvar("sender", sender);
       setvar("validity", validity);
       setvar("servicetype", servicetype);
       setvar("smscroute", smscroute);
       setvar("receiptrequested", receiptrequested);
       setvar("sourceport", sourceport);
       setvar("destport", destport);
       setvar("delayuntil", delayuntil);
       setvar("voicemail", voicemail);
       setvar("wapurl", wapurl);
       setvar("wapsl", wapsl);

       try {
          URL url2=new URL(url_str); 

          HttpURLConnection connection = (HttpURLConnection) url2.openConnection(); 
          connection.setDoOutput(false); 
          connection.setDoInput(true); 

          String res=connection.getResponseMessage(); 
		
          System.out.println("Response Code  ->"+res); 
	
          int code = connection.getResponseCode () ; 
		
          if ( code == HttpURLConnection.HTTP_OK ) {
             //Get response data.
             BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

             String str;
        
             while( null != ((str = in.readLine()))) {
                if (str.startsWith("MessageID=")) {  
                   returnstring = returnstring + str + "\r\n";
                   System.out.println(str);
                }
             }    
             connection.disconnect() ; 
          }
       }
       catch(IOException e) {
          System.out.println("unable to create new url"+e.getMessage());
       }
       return returnstring;
   }
}


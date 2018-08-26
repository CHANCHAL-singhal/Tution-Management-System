package com.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class SmsDao {
	
	
	public void SendSms(String mobiles,String msg)
	{
		
		/* Send SMS using JAVA */

		// Your authentication key
		String authkey = "203159AZ5gVun25aab6299";
		// Multiple mobiles numbers separated by comma
		// Sender ID,While using route4 sender id should be 6 characters
		// long.
		String senderId = "AMNTMS";

		// define route
		String route ="4";
		
		
		URLConnection myURLConnection = null;
		URL myURL = null;
		BufferedReader reader = null;

		// encoding message
		String encoded_message = URLEncoder.encode(msg);

		// Send SMS API
		String mainUrl = "https://control.msg91.com/api/sendhttp.php?";

		// Prepare parameter string
		StringBuilder sbPostData = new StringBuilder("https://control.msg91.com/api/sendhttp.php?");
		sbPostData.append("authkey=" + authkey);
		sbPostData.append("&mobiles=" + mobiles);
		sbPostData.append("&message=" + encoded_message);
		sbPostData.append("&route=" + route);
		sbPostData.append("&sender=" + senderId);

		// final string
		mainUrl = sbPostData.toString();
		try {
			// prepare connection
			myURL = new URL(mainUrl);
			myURLConnection = myURL.openConnection();
			myURLConnection.connect();
			reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
			// reading response
			String r;
			while ((r = reader.readLine()) != null)
				// print response

				if (r != null || r != "") {
					System.out.println(r);
					System.out.println("Otp Send Successfully on "+mobiles);
					
				}
			// finally close connection
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}

package com.ayo;

import java.util.Random;

public class GenerateOTP {
	   public String otp()
	   {
		   	String numbers = "0123456789";
		    Random random = new Random();
		    StringBuilder otp = new StringBuilder(6);

		    for (int i = 0; i < 6; i++) {
		        int index = random.nextInt(numbers.length());
		        otp.append(numbers.charAt(index));
		    }
		    
		    return otp.toString();
		    
	   }
}

$().ready(function() {
	$("#contact").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			name:{
				required:true,
				OnlyText:true
			},
			email:{
				required : true,
				email_add : true
			},
			phone:{
				required : true,
				mobile_no : true
			},
			message :{
				required : true
			}
				
		},
		messages : {
			name:{
				required:"Please Enter a Name."
			},
			email:{
				required:"Please Enter a Email Address."
			},
			phone:{
				required:"Please Enter a Phone Number."
			},
			message :{
				required : "Please Enter a Message."
			}
			
		}
	});
	$("#changepass").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			empcurpassword:{
				required:true,
				password:true
			},
			empnewpassword:{
				required:true,
				password:true
			},
			empconfirmpassword:{
				required:true,
				password:true,
				equalTo:"#empnewpassword"
			}
				
		},
		messages : {
			empcurpassword:{
				required:"Please Enter  current Password."
			},
			empnewpassword:{
				required:"Please Enter  New Password."
			},
			empconfirmpassword:{
				required:"Please Enter Confirm Password.",
				equalTo:"Confirm password not Match."
			}
			
		}
	});
	$("#formlogin").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			designation :{
				required : true
			},
			empusername:{
				required : true
			},
			emppassword :{
				
				required: true,
				password:true
			}
			
				
		},
		messages : {
			designation :{
				required: "Please Select Designation."
			} ,
		
		empusername :{
			required : "Please Enter Username."
			
		},
		emppassword : {
			required : "Please Enter Password."
		}
		},
	});

	$("#sendotp").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			email :{
				
			
			required : true,
			email_add : true
			}
			
				
		},
		messages : {
			email :{
				required :"Please Enter Email Address."
			}
			
		}
	});
	
	

	$("#confirmotp").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			EnterOtp :{
				
			
			required : true,
			onlydigit: true
			}
			
				
		},
		messages : {
			EnterOtp :{
				required :"Please Enter Otp."
			}
			
		}
	});
	$("#chgepass").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			NewPassword :{
				
			
			required : true,
			password: true
			},
			CPassword :{
				required : true,
				password: true,
				equalTo:"#NewPassword"
			}
			
				
		},
		messages : {
			NewPassword :{
				required :"Please Enter Password."
				
			},
			CPassword :{
				required :"Please Enter Confirm Password.",
				equalTo:"Confirm password not Match."
			}
			
		}
	});
	
	
	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z]+$/.test(value);
	}, "Please Alpha Characters Only.");
	$.validator.addMethod("OnlyText", function(value, element) {
		return /^[A-Za-z ]+$/.test(value);
	}, "Please Enter A valid Name.");
	$.validator.addMethod("examname", function(value, element) {
		return /^[A-Za-z0-9_]+$/.test(value);
	}, "Please Enter a Valid Exam Name.");
	$.validator.addMethod("email_add", function(value, element)
	{
		return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,3}$/i.test(value);
	}, "Please enter a valid email address.");
	$.validator.addMethod("mobile_no",function(value,element)
			{
				return this.optional(element) || /^[9876]\d{9}$/i.test(value);
			},"Enter a Valid 10 Digit Indian Mobile No.");
	$.validator.addMethod("aadhar",function(value,element)
			{
				return this.optional(element) || /^[0-9]{12}$/i.test(value);
			},"Enter a Valid Aadhar Card Number");
	$.validator.addMethod("onlydigit",function(value,element)
			{
				return this.optional(element) || /^[0-9]{1,9}$/i.test(value);
			},"Only Digits are Allowed.");
	$.validator.addMethod("password",function(value,element)
	{
		return this.optional(element) || /^[A-Za-z0-9!@#$%^&*()_]{6,16}$/i.test(value);
	},"Please Enter Valid 6 to 16 Character Password.");
});    

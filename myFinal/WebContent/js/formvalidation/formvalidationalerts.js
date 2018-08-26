$().ready(function() {
	 
	$("#alertstu").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true
			},
			subject:{
				required:true
				
			},
			header :
				{
				required:true
				},
				
			message:{
				required:true	
				},
				student: {
					
					required :true
				}
				
		},
		messages : {

			batch : {
				required : "Please Select Batch."
				
			},
			subject:{
				required:"Please Enter A Subject."
			},
			header:{
				required : "Please Enter Header."
			},
			message : {
				
				required: "Please Enter Message."
			},
			student:{
				required: "Please Select Student."
			}
			
		}
	});
	 
	$("#alertemp").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			designation : {
				required : true
			},
			subject:{
				required:true
				
			},
			header :
				{
				required:true
				},
				
			message:{
				required:true	
				},
				employee: {
					
					required :true
				}
				
		},
		messages : {

			designation : {
				required : "Please Select Designation."
				
			},
			subject:{
				required:"Please Enter A Subject."
			},
			header:{
				required : "Please Enter Header."
			},
			message : {
				
				required: "Please Enter Message."
			},
			employee:{
				required: "Please Select Employee."
			}
			
		}
	});
	 
		
	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z]+$/.test(value);
	}, "Please Alpha Characters Only.");
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
	},"Passwords are 6-16 characters");
});    

$().ready(function() {
	 
	$("#showempatt").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      /*submitHandler: function() {
				alert("submitted!");
			},*/
		rules : {

			empid : {
				required : true
			},
			sdate:{
				required:true
				
			},
			edate :
				{
				required:true
				},
				
				show:{
				required:true	
				}
				
		},
		messages : {

			batch : {
				required : "Please Select Employee."
				
			},
			sdate:{
				required:"Please Select Start Date."
			},
			edate:{
				required : "Please Select End Date."
			},
			show : {
				
				required: "Please Select Your Choice."
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

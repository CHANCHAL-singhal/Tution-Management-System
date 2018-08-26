$().ready(function() {
	 
	$("#stureg").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			stuname : {
				required : true,
				
				OnlyAlpha : true
			},
			stuaddress:{
				required:true
			},
			
			stuemail : {
				required : true,
				email_add:true
			},
			stumobile:{
				required:true,
				mobile_no:true
			},
			stugen:{
				required:true
			},
			parname : {
				required : true,
				
				OnlyAlpha : true
			},
			paremail : {
				required : true,
				email_add:true
			},
			parmobile:{
				required:true,
				mobile_no:true
			},

			courseid : {
				required : true
				
			},
			totalfees: {
				
				onlydigit : true
				
			},
			paidamount:
				{
				required : true,
				
				onlydigit : true
				}
			
		},
		messages : {

			stuname : {
				required : "Please Enter A Student Name...",
				
			},
			stuaddress:{
				required:"Please Enter A Address."
			},
			stuemail:{
				required:"Please Enter Email Address."
			},
			stumobile:{
				required:"Please Enter Mobile Number."
			},
			stugen : {
				
				required:"Please Select Student Gender."
			},
			parname : {
				required : "Please Enter A Parent Name...",
				
			},
			paremail:{
				required:"Please Enter Email Address."
			},
			
			parmobile:{
				required:"Please Enter Mobile Number."
			},
			courseid : {
				required:"Please Select Course."
				
			},
			totalfees : {
				required:"Please Enter Total Fees."
				
			},
			paidamount:
					{
				required:"Please Enter Paid Ammount."
					}
			
		}
	});
	


	$("#sturegup").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			stuname : {
				required : true,
				
				OnlyAlpha : true
			},
			stuaddress:{
				required:true
			},
			
			stuemail : {
				required : true,
				email_add:true
			},
			stumobile:{
				required:true,
				mobile_no:true
			},
			stugen:{
				required:true
			},
			parname : {
				required : true,
				
				OnlyAlpha : true
			},
			paremail : {
				required : true,
				email_add:true
			},
			parmobile:{
				required:true,
				mobile_no:true
			},

			courseid : {
				required : true
				
			},
			totalfees: {
				
				onlydigit : true
				
			},
			paidamount:
				{
				required : true,
				
				onlydigit : true
				}
			
		},
		messages : {

			stuname : {
				required : "Please Enter A Student Name...",
				
			},
			stuaddress:{
				required:"Please Enter A Address."
			},
			stuemail:{
				required:"Please Enter Email Address."
			},
			stumobile:{
				required:"Please Enter Mobile Number."
			},
			stugen : {
				
				required:"Please Select Student Gender."
			},
			parname : {
				required : "Please Enter A Parent Name...",
				
			},
			paremail:{
				required:"Please Enter Email Address."
			},
			
			parmobile:{
				required:"Please Enter Mobile Number."
			},
			courseid : {
				required:"Please Select Course."
				
			},
			totalfees : {
				required:"Please Enter Total Fees."
				
			},
			paidamount:
					{
				required:"Please Enter Paid Ammount."
					}
			
		}
	});

		
	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z]+$/.test(value);
	}, "Please Alpha Characters Only.");
	$.validator.addMethod("username", function(value, element) {
		return /^[A-Za-z0-9_.@#]+$/.test(value);
	}, "Please Enter a Valid Username.");
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

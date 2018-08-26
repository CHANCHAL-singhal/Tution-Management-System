$().ready(function() {
	 
	$("#fees").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			cname : {
				required : true
				
			},
			sid:{
				required:true
			},
			
			totalfees : {
				required : true,
				onlydigit : true
			},
			paid:{
				required:true,
				onlydigit : true
			},
			remaining :{
				required:true,
				onlydigit : true
			},
			ptype : {
				required : true
				
			},
			pdetail : {
				required : true
				
			},
			installment:{
				required:true
			},

			amount : {
				required : true,
				onlydigit : true
				
			},
			date : {
				required:true
			
				
			}
			
		},
		messages : {

			cname : {
				required : "Please Select Course.",
				
			},
			sid:{
				required:"Please Select Student."
			},
			totalfees:{
				required:"Please Enter Total Fees."
			},
			paid:{
				required:"Please Enter Paid Fees."
			},
			remaining : {
				
				required:"Please Enter Remaining Fees."
			},
			ptype : {
				required : "Please Select Payment Type.",
				
			},
			pdetail:{
				required:"Please Enter Payment Detail."
			},
			
			installment:{
				required:"Please Select Installment Number."
			},
			amount : {
				required:"Please Enter Ammount."
				
			},
			date : {
				required:"Please Select Date."
				
			} 
		}
	});
	
	$("#feesup").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			
			sid:{
				required:true
			},
			
			totalfees : {
				required : true,
				onlydigit : true
			},
			paid:{
				required:true,
				onlydigit : true
			},
			remaining :{
				required:true,
				onlydigit : true
			},
			ptype : {
				required : true
				
			},
			pdetail : {
				required : true
				
			},
			installment:{
				required:true
			},

			amount : {
				required : true,
				onlydigit : true
				
			},
			date : {
				required:true
			
				
			}
			
		},
		messages : {

			sid:{
				required:"Please Select Student."
			},
			
			totalfees:{
				required:"Please Enter Total Fees."
			},
			paid:{
				required:"Please Enter Paid Fees."
			},
			remaining : {
				
				required:"Please Enter Remaining Fees."
			},
			ptype : {
				required : "Please Select Payment Type.",
				
			},
			pdetail:{
				required:"Please Enter Payment Detail."
			},
			
			installment:{
				required:"Please Select Installment Number."
			},
			amount : {
				required:"Please Enter Ammount."
				
			},
			date : {
				required:"Please Select Date."
				
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

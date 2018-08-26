$().ready(function() {
	 
	$("#inquiry").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			isname : {
				required : true,
				OnlyText:true
			},

			isemail : {
				required : true,
				email_add:true
			},
			ismobile:{
				required:true,
				mobile_no:true
			},
			date:{
				required:true
			},
			

			icourse : {
				required : true
				
			},
						
		},
		messages : {

			isname : {
				required : "Please Enter A Student Name...",
				
			},
		
			isemail:{
				required:"Please Enter Email Address."
			},
			ismobile:{
				required:"Please Enter Mobile Number."
			},
			
			date:{
				required:"Please Enter Date."
			},
			icourse : {
				required:"Please Select Course."
				
			},

			
		}
	});

	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z]+$/.test(value);
	}, "Please Alpha Characters Only.");
	$.validator.addMethod("OnlyText", function(value, element) {
		return /^[A-Za-z ]+$/.test(value);
	}, "Please Enter A valid Student Name.");

	$.validator.addMethod("email_add", function(value, element)
	{
		return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,3}$/i.test(value);
	}, "Please enter a valid email address.");
	$.validator.addMethod("mobile_no",function(value,element)
			{
				return this.optional(element) || /^[9876]\d{9}$/i.test(value);
			},"Enter a Valid 10 Digit Indian Mobile No.");
	$.validator.addMethod("onlydigit",function(value,element)
			{
				return this.optional(element) || /^[0-9]{1,9}$/i.test(value);
			},"Only Digits are Allowed.");
});   
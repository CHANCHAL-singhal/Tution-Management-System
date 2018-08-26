$().ready(function() {
	 
	$("#empreg").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			empusername : {
				required : true,
				minlength : 5,
				maxlength : 20,
				username : true
			},
			
			emppassword:{
				required:true,
				password:true
			},
			empconfirmpassword:{
				required:true,
				equalTo:"#emppassword"
			},
			empname : {
				required : true,
				minlength : 4,
				maxlength : 20,
				OnlyAlpha : true
			},
			empaddress:{
				required:true
			},
			empemail : {
				required : true,
				email_add:true
			},
			empmobile:{
				required:true,
				mobile_no:true
			},
			empgen:{
				required:true
			},
			empqualification : {
				required : true,
				OnlyAlpha : true
				
			},
			empjoindate:{
				required : true
			},
			empdesignation : {
				required : true
			},
			empaadhar : {
				
				
				aadhar : true
			},
			empsalary : {
				required : true,
				onlydigit : true
			},
			emppic : {
				
				required : true
			}
		},
		messages : {
			empusername : {
				required : "Please Enter A Usename.",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")
			},
			
			emppassword:{
				required:"Please Enter Password."
			},
			empconfirmpassword:{
				required:"Please Enter Confirm Password.",
				equalTo:"Confirm password not Match."
			},
			empname : {
				required : "Please Enter A Employee Name...",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")
			},
			empaddress:{
				required:"Please Enter A Address."
			},
			empemail:{
				required:"Please Enter Email Address."
			},
			empmobile:{
				required:"Please Enter Mobile Number."
			},
			empgen : {
				
				required:"Please Select Employee Gender."
			},
			empqualification:{
				required:"Enter Employee Qualification."
				
			},
			empjoindate : {
				required:"Please Select Join Date."
			},
			empdesignation : {
				required :"Please Select Employee Designation."
			},
			empsalary : {
				required : "Please Enter Employee Salary."
			},
			emppic:{
				
				required : "Please Upload A Employee Photo."
			}
		}
	});
	
	$("#Register1").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			empusername : {
				required : true,
				minlength : 5,
				maxlength : 20,
				username : true
			},
			
			empname : {
				required : true,
				minlength : 4,
				maxlength : 20,
				OnlyAlpha : true
			},
			empaddress:{
				required:true
			},
			empemail : {
				required : true,
				email_add:true
			},
			empmobile:{
				required:true,
				mobile_no:true
			},
			empgen:{
				required:true
			},
			empqualification : {
				required : true,
				OnlyAlpha : true
				
			},
			empjoindate:{
				required : true
			},
			empdesignation : {
				required : true
			},
			empaadhar : {
				
				
				aadhar : true
			},
			empsalary : {
				required : true,
				onlydigit : true
			},
			emppic : {
				
				required : true
			}
		},
		messages : {
			empusername : {
				required : "Please Enter A Usename.",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")
			},
		
			empname : {
				required : "Please Enter A Employee Name...",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")
			},
			empaddress:{
				required:"Please Enter A Address."
			},
			empemail:{
				required:"Please Enter Email Address."
			},
			empmobile:{
				required:"Please Enter Mobile Number."
			},
			empgen : {
				
				required:"Please Select Employee Gender."
			},
			empqualification:{
				required:"Enter Employee Qualification."
				
			},
			empjoindate : {
				required:"Please Select Join Date."
			},
			empdesignation : {
				required :"Please Select Employee Designation."
			},
			empsalary : {
				required : "Please Enter Employee Salary."
			},
			emppic:{
				
				required : "Please Upload A Employee Photo."
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
	},"Please Enter Valid 6 to 16 Character Password.");
});    

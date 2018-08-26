$(function() {
	$("#form").validate({
		rules : {
			fname : {
				required : true,
				minlength : 4,
				maxlength : 20,
				OnlyAlpha : true
			},
			address:{
				required:true
			},
			gen:{
				required:true
			},
			h:{
				required:true
			},
			education:{
				required:true
			},
			uname:{
				required:true,
				username:true
			},
			password:{
				required:true,
				password:true
			},
			cpassword:{
				required:true
			}
		},
		messages : {
			fname : {
				required : "Please enter a name",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")
			},
			address:{
				required:"Please Enter A Address"
			},
			gen:{
				required:"" 
			},
			h:{
				required:""
			},
			education:{
				required:"Please Select Education"
			},
			uname:{
				required:"Please Enter User Name"
			},
			password:{
				required:"Please Enter Password"
			},
			cpassword:{
				required:"Please Enter Confirm Password"
			}
		}
	});
	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z\_ -]+$/.test(value);
	}, "Alpha Characters Only.");
	$.validator.addMethod("email", function(value, element)
	{
		return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/i.test(value);
	}, "Please enter a valid email address.");
	$.validator.addMethod("username",function(value,element)
	{
		return this.optional(element) || /^[a-zA-Z0-9._-]{3,16}$/i.test(value);
	},"Username are 3-15 characters");
	$.validator.addMethod("password",function(value,element)
	{
		return this.optional(element) || /^[A-Za-z0-9!@#$%^&*()_]{6,16}$/i.test(value);
	},"Passwords are 6-16 characters");
});

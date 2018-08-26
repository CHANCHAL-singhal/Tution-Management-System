$().ready(function() {
	$("#combat").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true
				
				
			}
			
	},
		messages : {

			batch : {
				required : "Please Select Batch."
				
			}
		}
	});
	$("#batch1").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			bname : {
				required : true,
				batname : true
				
			},
			stime:{
				required:true
			},
			
			etime : {
				required : true
				
			},
			Ename:{
				required:true
			},
			Csubject :{
				required:true
			},
			Cname : {
				required : true
				
			},
			sdate : {
				required : true
				
			}
			
	},
		messages : {

			bname : {
				required : "Please Enter A Batch Name."
				
			},
			stime:{
				required:"Please Select Starting Time of Batch."
			},
			etime:{
				required:"Please Select End Time of Batch."
			},
			Ename:{
				required:"Please Select Faculty Name."
			},
			Csubject : {
				
				required:"Please Select Batch Subject."
			},
			Cname : {
				required : "Please Select Course."
				
			},
			sdate:{
				required:"Please Select Start Date."
			}
		}
	});
	
	$("#batchup").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			bname : {
				required : true,
				batname : true
				
			},
			stime:{
				required:true
			},
			
			etime : {
				required : true
				
			},
			Ename:{
				required:true
			},
			Csubject :{
				required:true
			},
			Cname : {
				required : true
				
			},
			sdate : {
				required : true
				
			}
			
	},
		messages : {

			bname : {
				required : "Please Enter A Batch Name."
				
			},
			stime:{
				required:"Please Select Starting Time of Batch."
			},
			etime:{
				required:"Please Select End Time of Batch."
			},
			Ename:{
				required:"Please Select Faculty Name."
			},
			Csubject : {
				
				required:"Please Select Batch Subject."
			},
			Cname : {
				required : "Please Select Course."
				
			},
			sdate:{
				required:"Please Select Start Date."
			}
		}
	});

	$("#batchadd").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true
				
				
			}
			
	},
		messages : {

			batch : {
				required : "Please Select Batch."
				
			}
		}
	});
	$("#batchrem").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true
				
				
			},
			date : {
				
				required: true
			}
			
	},
		messages : {

			batch : {
				required : "Please Select Batch."
				
			},
			date : {
				required : "Please Select Date."
			}
		}
	});

	
	$("#batchcomplete").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true
				
				
			}
			
	},
		messages : {

			batch : {
				required : "Please Select Batch."
				
			}
		}
	});

	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z]+$/.test(value);
	}, "Please Alpha Characters Only.");
	$.validator.addMethod("batname", function(value, element) {
		return /^[A-Za-z0-9_]+$/.test(value);
	}, "Please Enter a Valid Batch Name.");
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

$().ready(function() {
	 
	$("#newcou").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			cname : {
				required : true,
				OnlyAlpha : true
			},
			cfees:{
				required:true,
				onlydigit : true
			},
			cduration:{
				required:true,
				onlydigit : true
			}
			
		},
		messages : {

			cname : {
				required : "Please Enter A Course Name .",
				
			},
			cfees:{
				required:"Please Enter Course Fees ."
			},
			cduration:{
				required:"Please Enter Course Duration ."
			}
		}
	});
		
	$("#upcou").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			cname : {
				required : true,
				OnlyAlpha : true
			},
			cfees:{
				required:true,
				onlydigit : true
			},
			cduration:{
				required:true,
				onlydigit : true
			}
			
		},
		messages : {

			cname : {
				required : "Please Enter A Course Name .",
				
			},
			cfees:{
				required:"Please Enter Course Fees ."
			},
			cduration:{
				required:"Please Enter Course Duration ."
			}
		}
	});
	
	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z0-9 ]+$/.test(value);
	}, "Enter A Valid Name only.");
		
	$.validator.addMethod("onlydigit",function(value,element)
			{
				return this.optional(element) || /^[0-9]{1,9}$/i.test(value);
			},"Only Digits are Allowed.");
	});    

$().ready(function() {
	 
	$("#stuatt").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true,
			},
			date:{
				required:true
			}			
		},
		messages : {

			batch : {
				required : "Please Select Batch .",
				
			},
			date:{
				required:"Please Select Date ."
			}
		}
	});
	
	$("#stuattrem").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {

			batch : {
				required : true,
			},
			date:{
				required:true
			}			
		},
		messages : {

			batch : {
				required : "Please Select Batch .",
				
			},
			date:{
				required:"Please Select Date ."
			}
		}
	});
	

		
	});    

/**
 * 
 */
function doAjaxPost() {  
	  var customer = new Object();
			customer.name = $('#name').val();
			customer.dob = $('#dob').val();
			customer.phone = $('#phone').val();
			customer.street = $('#street').val();
			customer.address1 = $('#address1').val();
			customer.address2 = $('#address2').val();
			customer.city = $('#city').val();
			customer.country = $('#country').val();
			customer.pin = $('#pin').val();
			customer.product = $('#product').val();
			customer.quantity = $('#quantity').val();
			customer.price = $('#price').val();

			//event.preventDefault();
			$.ajax({
				url : $("#order").attr("action"),
				data : JSON.stringify(customer),
				type : "POST",
				//contentType : "application/json; charset=utf-8",
				beforeSend : function(requestheader) {
					requestheader.setRequestHeader("Accept", "application/json");
					requestheader.setRequestHeader("Content-Type", "application/json");
				},
				success: function(data) {
		            var respContent = "";
		            respContent = "<span>Order is created:</span>";
		             
		            $("#ajaxPostResponse").html(respContent);         
		        }
			});	      // we have the response 
	      if(response.status == "SUCCESS"){
	    	  userInfo = "<ol>";
	    	  for(i =0 ; i < response.result.length ; i++){
	    		  userInfo += "<br><li><b>Name</b> : " + response.result[i].name + 
	    		  ";<b> Education</b> : " + response.result[i].education;
	    	  }
	    	  userInfo += "</ol>";
	    	  $('#info').html("User has been added to the list successfully. " + userInfo);
	    	  $('#name').val('');
		      $('#education').val('');
		      $('#error').hide('slow');
		      $('#info').show('slow');
	      }else{
	    	  errorInfo = "";
	    	  for(i =0 ; i < response.result.length ; i++){
	    		  errorInfo += "<br>" + (i + 1) +". " + response.result[i].code;
	    	  }
	    	  $('#error').html("Please correct following errors: " + errorInfo);
	    	  $('#info').hide('slow');
	    	  $('#error').show('slow');
	      }	      
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}  
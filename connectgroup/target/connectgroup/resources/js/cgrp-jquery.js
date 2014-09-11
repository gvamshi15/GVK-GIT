/**
 * Date Picker
 */
function loadAll() {

	$('#dob').datepicker({
		changeMonth : true,
		changeYear : true,
		shortYearCutoff : 99,
		maxDate : "-1D",
		showWeek : true,
		firstDay : 1,
		dateFormat : 'yy-mm-dd',
		beforeShow : function() {
			$(".ui-datepicker").css('font-size', 10)
		}
	});

	// for numeric field validation
	// called when key is pressed in textbox
	$("#phone").keypress(function(e) {
		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			// display error message
			$('#msgPhone').html("Digits Only").show().fadeOut("slow");
			return false;
		}
	});

	// called when key is pressed in textbox
	$("#quantity").keypress(
			function(event) {
				if (event.which != 8 && event.which != 0
						&& (event.which < 48 || event.which > 57)) {
					// display error message
					$('#msgQty').html("Digits Only").show().fadeOut("slow");
					return false;
				}
			});

	/**
	 * Performing Ajax post request doing some work around as serialise is not
	 * supporting
	 * 
	 */
	$('#order').submit(
			function(event) {
				var customer = new Object();
				customer.name = $('#name').val();
				customer.dob = $('#dob').val();
				customer.phone = $('#phone').val();
				customer.address1 = $('#address1').val();
				customer.city = $('#city').val();
				customer.pin = $('#pin').val();
				customer.product = $('#product').val();
				customer.quantity = $('#quantity').val();

				$.ajax({
					url : $("#order").attr("action"),
					data : JSON.stringify(customer),
					type : "POST",
					beforeSend : function(requestheader) {
						requestheader.setRequestHeader("Accept",
								"application/json");
						requestheader.setRequestHeader("Content-Type",
								"application/json");
					},
					success : function(response) {
						if (response.status == "SUCCESS") {
							window.location = response.location;
						} else {
							errorInfo = "";
							for (i = 0; i < response.result.length; i++) {
								errorInfo += "<br/>" + (i + 1) + ". "
										+ response.result[i].code;
							}
							$('#error').html(
									"Correct the below errors and proceed: "
											+ errorInfo);
							$('#error').show('slow');
						}
					}
				});
				event.preventDefault();
			});
}
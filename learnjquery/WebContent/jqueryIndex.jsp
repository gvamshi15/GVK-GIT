<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The jQuery Example</title>
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>

<script type="text/javascript" language="javascript">
	// <![CDATA[
	$(document).ready(function() { //we can replace $ with jquery
		$("#newdiv").click(function() {
			alert("Hello world!");
		});

		//$(window).Document.back(false);

		//callback - function passed as an argument some method
		$("p").click(function() {
			//document.writeln("clicked: ");
			alert("Cliked!");
		});

		$("em").addClass("selected");
		$("#myid").addClass("highlight");

		$("form").submit(function() {
			$(":submit", this).attr("disabled", "disabled");
		});

		/* $("input:checkbox:checked").val() */
		$("#chkbx").click(function() {
			$(":submit").attr("disabled", "disabled");
			$(":submit").removeAttr("disabled");
		});

		$("li").eq(2).css({"color":"red", 
                "background-color":"green"});

		$("#div1").click(function () {
			   var color1 = getRandomColor();
		       //alert("color1!"+color1);
		       $(this).before('<div class="div1" style="background-color:'+color1+';\"></div>' );
		       $(this).remove( );
		    });

		$("#div2").click(function(event){
	          alert("1 - This is : " + $(this).text());
	          // Comment the following to see the effect.
	          //event.stopPropagation();
	          //event.stopImmediatePropagation();
	      });

	      // This won't be executed.
	      $("#div2").click(function(event){
	          alert("2 - This is : " + $(this).text());
	      });

		$("#div3").toggle(
			function () {
				$(this).css({"background-color":"red"});
				},
			function () {
	           $(this).css({"background-color":"yellow"});
	           },
	        function () {
	           $(this).css({"background-color":"black"});
	           });
	});

	function getRandomColor() {
	    var letters = '0123456789ABCDEF'.split('');
	    var color = '#';
	    for (var i = 0; i < 6; i++ ) {
	        color += letters[Math.floor(Math.random() * 16)];
	    }
	    return color;
	}
	
	//closure example - look for counter data hiding example
	function create() {
		var counter = 0;
		return {
			increment : function() {
				counter++;
			},
			print : function() {
				document.writeln(counter);
			}
		}
	}
	var c = create();
	c.increment();
	c.print(); // ==> 1

	//proxy is an pbject that is used to control access to another object
	//selectors
	//$() - factory function
	//$('p') - selects all paragraph elements - Tag Name
	//$('#id1') - selects element with id id1 - Tag Id
	//$('.some-class') - selects elemet with class somclass - Tag Class

	// ]]>
</script>
<style type="text/css">
#newdiv {
	margin: 10px;
	padding: 12px;
	border: 2px solid #666;
	width: 60px;
}

.div12 {
	margin: 10px;
	padding: 12px;
	border: 2px solid #666;
	width: 60px;
}

 .div3 { margin:10px;padding:12px;
             border:2px solid #666;
             width:200px;
           }
</style>
</head>
<body>
	<div id="newdiv">Click on this to see a dialogue box.</div>
	<p>My Foot</p>
	<em title="Bold and Brave">This is first paragraph.</em>
	<p id="myid">This is second paragraph.</p>
	<div>
		<ul>
			<li>list item 1</li>
			<li>list item 2</li>
			<li>list item 3</li>
			<li>list item 4</li>
			<li>list item 5</li>
			<li>list item 6</li>
		</ul>
	</div>
	<form action="javascript:void()">
		<input type="checkbox" id="chkbx"> <input type="submit"
			id="id1">
	</form>

	<p>Click on any square below:</p>
	<span id="result"> </span>
	<div id="div1" class="div12" style="background-color: blue;"></div>
	<div id="div1" class="div12" style="background-color: green;"></div>
	<div id="div1" class="div12" style="background-color: red;"></div>

<!-- For Event Propagation  -->
	<div id="div2" class="div12" style="background-color: blue;">BOX 1</div>
	<div id="div2" class="div12" style="background-color: red;">BOX 2</div>

<!-- For Event Toggling - between multiple functions each time event occurs-->
	<div id="div3" class="div3" style="background-color:blue;"></div>
</body>
</html>

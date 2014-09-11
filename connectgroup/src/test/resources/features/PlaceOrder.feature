Feature: User Should Place an Order

	As a User 
	I want to Enter the Order Details
	So that i can Place an Order
	
@UserNavigate
Scenario: User is able to Navigate to Place Order Page
	Given User is on the View RecordsPage
	When  User seletcs Create Order
	Then  User should see Place order Page
	
@UserPlaceOrder
Scenario Outline: User is able to place an order
	Given User is on the Place Order Page
	When User Enters <Customer Name>
	And 
	When User Selects <DoB>
	And
	When User Enters <Mobile Number>
	And
	When User Inputs <Address>
	And 
	When User Enters <City>
	And
	When User Enters <PostCode>
	And 
	When User Seletcs the <Products>
	And 
	When User Enters <Quantity>
	And 
	When User Selects Terms & Condition
	And 
	When User Selects Create Order
	Then User is able to see the placed Order
	
	Examples: 
	|Customer Name| DoB |Mobile Number|Address|City|PostCode|Products|Quantity|
	|Vamshi	  |	1979-06-15|		86686868      |	UK	  |UK    |E35TGA		|	Lenovo	 |		4  |

	

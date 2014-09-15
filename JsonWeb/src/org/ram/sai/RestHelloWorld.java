/**
 * 
 */
package org.ram.sai;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * @author Lenovo
 *
 */
@Path("/hello")
public class RestHelloWorld {
	
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String sayHello(@QueryParam("name")String name) {
	    //System.out.println("Hello: " + name);
	    return "Hello " + name + "!";
	}

}

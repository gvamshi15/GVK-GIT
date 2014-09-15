package com.java4s;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.MatrixParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.UriInfo;

import com.java4s.jaxb.Student;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;

@Path("/customers")
public class HelloWorldService {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response getLocalCust() {

		String output = "I am from 'getLocalCust' method";
		return Response.status(200).entity(output).build();
	}

	@GET
	@Path("{site}/{tutorial}/{rank}")
	public Response getTutorial(@PathParam("site") String site,
			@PathParam("tutorial") String tutorial,
			@PathParam("rank") String rank) {
		return Response
				.status(200)
				.entity("Web Site : " + site + "  Tutorial : " + tutorial
						+ " Rank : " + rank).build();
	}

	@GET
	@Path("{index}")
	public Response getTutorial(@PathParam("index") String index) {
		return Response
				.status(200)
				.entity("The Tutorial at Index " + index
						+ " is RESTful webservice").build();
	}

	@GET
	@Path("/nri")
	@Produces(MediaType.TEXT_HTML)
	public Response getNriCust() {

		String output = "I am from 'getNriCust' method";
		return Response.status(200).entity(output).build();
	}

	@GET
	@Path("{name}/{country}")
	@Produces(MediaType.TEXT_HTML)
	public Response getResultByPassingValue(@PathParam("name") String name,
			@PathParam("country") String country) {
		String output = "Customer name - " + name + ", Country - " + country
				+ "";
		return Response.status(200).entity(output).build();
	}

	@GET
	@Path("/java-tutorial")
	public Response getTutorial(@QueryParam("site") String site,
			@QueryParam("tutorial") String tutorial,
			@QueryParam("rank") int rank) {
		return Response
				.status(200)
				.entity("Web Site : " + site + "  Tutorial : " + tutorial
						+ " Rank : " + rank).build();
	}

	@GET
	@Path("/querycontexturi")
	public Response getTutorial(@Context UriInfo uriInfo) {
		String site = uriInfo.getQueryParameters().getFirst("site");
		List<String> tutorials = uriInfo.getQueryParameters().get("tutorial");
		String rank = uriInfo.getQueryParameters().getFirst("rank");
		return Response
				.status(200)
				.entity("Web Site : " + site + "  Tutorial : "
						+ tutorials.toString() + " Rank : " + rank).build();
	}

	@GET
	@Path("/matrixparam")
	public Response getTutorials(@MatrixParam("site") String site,
			@MatrixParam("tutorial") String tutorial,
			@MatrixParam("rank") String rank) {
		return Response
				.status(200)
				.entity("Web Site : " + site + "  Tutorial : " + tutorial
						+ " Rank : " + rank).build();

	}

	@POST
	@Path("/submit")
	public Response getFormTutorial(@FormParam("site") String site,
			@FormParam("tutorial") String tutorial,
			@FormParam("rank") String rank) {
		return Response
				.status(200)
				.entity("Web Site : " + site + "  Tutorial : " + tutorial
						+ " Rank : " + rank).build();

	}

	@GET
	@Path("/java-tutorial-corner/context-http-headers")
	public Response getTutorialHeader1(@Context HttpHeaders httpHeaders) {
		String userAgent = httpHeaders.getRequestHeader("user-agent").get(0);
		return Response.status(200).entity("User Agent Details : " + userAgent)
				.build();
	}

	@GET
	@Path("/java-tutorial-corner/headerparam")
	public Response getTutorialHeader(
			@HeaderParam("user-agent") String userAgent) {
		return Response.status(200).entity("User Agent Details : " + userAgent)
				.build();
	}

	@GET
	@Path("/jaxb/{id}")
	@Produces(MediaType.APPLICATION_XML)
	public Student getStudentDetail(@PathParam("id") int id) {
		Student student = new Student();
		student.setName("SaiRam Vamshi");
		student.setId(id);
		student.setDepartment("IDC");
		student.setYear("2011");

		return student;
	}

	private static final String FILE_PATH = "C://Users/Lenovo/Desktop/items.txt";

	@GET
	@Path("/txt-file")
	@Produces(MediaType.TEXT_PLAIN)
	public Response downloadFile(@HeaderParam("user-agent") String userAgent) {
		File file = new File(FILE_PATH);
		ResponseBuilder responseBuilder = Response.ok((Object) file);
		// responseBuilder.status(200).entity("User Agent Details : " +
		// userAgent);
		responseBuilder.header("Content-Disposition",
				"attachment; filename=\"java-tutorials-items.txt\"");
		return responseBuilder.build();
	}

	private static final String FILE_PATH1 = "C://Users//Lenovo//Desktop//form19.pdf";

	@GET
	@Path("/pdf-file")
	@Produces("application/pdf")
	public Response downloadPDFFile() {
		File file = new File(FILE_PATH1);
		ResponseBuilder responseBuilder = Response.ok((Object) file);
		responseBuilder.header("Content-Disposition",
				"attachment; filename=\"java-tutorials-corner.pdf\"");
		return responseBuilder.build();
	}

	private static final String FILE_PATH2 = "C://Users//Lenovo//Desktop//java-tutorials.png";

	@GET
	@Path("/image-file")
	@Produces("image/png")
	public Response downloadImageFile() {
		File file = new File(FILE_PATH2);
		ResponseBuilder responseBuilder = Response.ok((Object) file);
		responseBuilder.header("Content-Disposition",
				"attachment; filename=\"java-tutorials-corner.png\"");
		return responseBuilder.build();
	}

	@GET
	@Path("/getStudent")
	@Produces(MediaType.APPLICATION_JSON)
	public Student getStudentDetail() {
		Student student = new Student();
		student.setName("Ram");
		student.setId(33);
		student.setDepartment("EEE");
		student.setYear("2011");
		return student;
	}

	@POST
	@Path("/postStudent")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response setStudentDetail(Student student) {
		String response = "Data Received Successfuly : " + student.getName();
		return Response.status(201).entity(response).build();
	}

	
	@POST
	@Path("upload")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadFile(@FormDataParam("file") InputStream inputStream,
			@FormDataParam("file") FormDataContentDisposition file) {
		String response = "";
		try {
			final String FILE_DESTINATION = "C://rest//" + file.getFileName();
			File f = new File(FILE_DESTINATION);
			OutputStream outputStream = new FileOutputStream(f);
			int size = 0;
			byte[] bytes = new byte[1024];
			while ((size = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, size);
			}
			outputStream.flush();
			outputStream.close();

			response = "File uploaded " + FILE_DESTINATION;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Response.status(200).entity(response).build();
	}

}
